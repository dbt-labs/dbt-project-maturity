with 

claim_diagnoses as (
    select * from {{ ref('stg_claim_diagnosis') }}
),

final as (

    select 
        claim_id, 
        max(case when diagnosis_number = 1 then icd_10_code else null end) as diagnosis_1,
        max(case when diagnosis_number = 2 then icd_10_code else null end) as diagnosis_2,
        max(case when diagnosis_number = 3 then icd_10_code else null end) as diagnosis_3,
        max(case when diagnosis_number = 1 then icd_10_code_descrip else null end) as diagnosis_description_1,
        max(case when diagnosis_number = 2 then icd_10_code_descrip else null end) as diagnosis_description_2,
        max(case when diagnosis_number = 3 then icd_10_code_descrip else null end) as diagnosis_description_3
    
    from claim_diagnoses

    group by 1


)

select * from final