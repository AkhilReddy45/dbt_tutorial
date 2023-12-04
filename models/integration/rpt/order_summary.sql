

with final as (
    select c.r_name as region_name, 
    count(*) as order_count , 
    sum(o.o_totalprice) as total_amount
    from {{ source('my_project', 'orders') }} o
    inner join {{ ref('customer_details') }} c on o.o_custkey = c.c_custkey
    group by all
)
select *
from final