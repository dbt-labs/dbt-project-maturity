with 

claim_diagnoses as (
    select * from {{ ref('stg_claim_diagnosis') }}
),

final as (

    select 
        claim_id, 
        max(case when diagnosis_number = 1 then icd_10_code else null end) as primary_diagnosis,
        max(case when diagnosis_number = 2 then icd_10_code else null end) as secondary_diagnosis,
        max(case when diagnosis_number = 3 then icd_10_code else null end) as tertiary_diagnosis,
        max(case when diagnosis_number = 1 then icd_10_code_descrip else null end) as primary_diagnosis_description,
        max(case when diagnosis_number = 2 then icd_10_code_descrip else null end) as secondary_diagnosis_description,
        max(case when diagnosis_number = 3 then icd_10_code_descrip else null end) as tertiary_diagnosis_description
    
    from claim_diagnoses

    group by 1


)

select * from final