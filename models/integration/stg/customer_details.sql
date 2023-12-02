{{
    config(
        materialized="view",
        alias="customer_details",
        schema="STG"
    )
}}

with final as 
(
    select c.c_custkey,
    c_name,
    c_address,
    c_phone,
    n.n_name,
    r.r_name
from {{ source('my_project', 'customer') }} c 
inner join {{ source('my_project', 'nation') }} n on c.c_nationkey = n.n_nationkey
inner join {{ source('my_project', 'region') }} r on n.n_regionkey = r.r_regionkey
)
select *
from final