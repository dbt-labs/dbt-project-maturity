-- if it's not abundantly clear this is a completely fabricated query on data that exists nowhere

select 
    p.name_f || p.name_l as pat_name,
    p.dob,
    d.name,
    d.npi,
    (select max(specialty) from {{ source('ehr_data', 'doc_specialties') }}  ds where ds.doc_id = d.id) as spec_name,
    c.ClaimNumber,

    ca.total_claim_amnt
    ca.paid_amnt
from 
    {{ source('ehr_data', 'patients') }}  p
    join {{ source('billing_data', 'claims') }}  c
        on p.id = c.pat_id
    left join (
        select 
            cl.claim_id, 
            sum(chrgamnt) total_claim_amnt,
            sum(paid_amnt) paid_amnt
        from {{ source('billing_data', 'claim_line') }} 
        where status in ('billed', 'adjudicated', 'closed')
        group by 1
    ) ca 
        on c.id = ca.claim_id
    left join ( 
        select 
            *
        from {{ ref('claim_diagnoses') }}
        where diagnosis_number = 1
    ) as prim_diag
    on c.id = prim_diag.claim_id
    left join ( 
        select 
            *
        from {{ ref('claim_diagnoses') }}
        where diagnosis_number = 2
    ) as sec_diag
    on c.id = sec_diag.claim_id
    left join {{ source('ehr_data', 'doctors') }}  d
        on c.doc_id = d.id 

where claim.is_test = false 
and patient.email not like '%@test-patient.com'
and claim.bill_attmps > 0