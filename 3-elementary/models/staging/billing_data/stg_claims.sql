with 

source as (
    select * from {{ source('billing_data', 'claims') }} 
),

renamed as (

    select 
        id as claim_id,
        pat_id as claim_id,
        doc_id as doctor_id,
        prac_id as practice_id,
        car_id as carrier_id,
        npi as npi,

        -- varchsrs
        ClaimNumber as carrier_claim_number,

        -- dates
        create as created_at,
        firstbill as first_billed_at,
        _fivetran_synced_at as _fivetran_synced_at

    
    from source

    where not(is_test)

)

select * from renamed