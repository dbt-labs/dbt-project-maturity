{{
  config(
    materialized = 'incremental',
    unique_key = 'claim_id',
    )
}}

with 

claims as (
    select * from {{ ref('stg_claims') }}
    {% if is_incremental() %}
      where stg_claims.created_at >= (select max(created_at) from {{ this }})
    {% endif %}

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
        claims.claim_id,
        patients.patient_name,
        patients.date_of_birth,
        doctors.doctor_name,
        doctors.npi,
        specialties.specialty_name,
        claim_diagnoses.diagnosis_1,
        claim_diagnoses.diagnosis_description_1,
        claim_diagnoses.diagnosis_2,
        claim_diagnoses.diagnosis_description_2,
        claims.carrier_claim_number,
        claim_charge_amounts.total_charge_amount,
        claim_charge_amounts.total_paid_amount,
        claims.created_at,
        claims.first_billed_at
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
            on doctors.doctor_id = specialties.doctor_id
    
    where claims.has_ever_been_billed

)

select * from final
