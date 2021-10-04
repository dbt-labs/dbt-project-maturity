with 

claims as (
    select * from {{ ref('stg_claims') }}
),

claim_charge_amounts as (
    select * from {{ ref('int_billed_claim_amounts') }}
),

claim_diagnoses as (
    select * from {{ ref('int_claim_diagnosis_pivoted') }}
),

patients as (
    select * from {{ ref('stg_patients') }}
),

doctors as (
    select * from {{ ref('stg_doctors') }}
),

specialties as (
    select * from {{ ref('stg_doc_specialties') }}
),

final as (

select 
    patients.patient_name,
    patients.date_of_birth,
    doctors.doctor_name,
    doctors.npi,
    specialties.specialty_name,
    claim_diagnoses.primary_diagosis,
    claim_diagnoses.primary_diagosis_description,
    claim_diagnoses.secondary_diagosis,
    claim_diagnoses.secondary_diagosis_description,
    claims.carrier_claim_number,
    ca.total_claim_amnt
    ca.paid_amnt
from 
    patients
    join claims
        on patients.patient_id = claims.patient_id
    left join claim_charge_amounts
        on claims.claim_id = claim_charge_amounts.claim_id
    left join claim_diagnoses
        on claims.claim_id = claim_diagnoses.claim_id
    left join doctors
        on claims.doctor_id = doctors.doctor_id
    left join specialties
        on docstors.doctor_id = specialties.doctor_id
    
    where claims.has_ever_been_billed

)

select * from final
