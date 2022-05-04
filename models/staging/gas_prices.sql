{{ config(materialized='view') }}


select  
  json_value(city, '$.lowerName') id,
  json_value(city, '$.name') city_name,
  json_value(city, '$.currency') currency,
  json_value(city, '$.diesel') diesel,
  json_value(city, '$.premium') premium,
  json_value(city, '$.gasoline') gasoline,
  json_value(city, '$.midGrade') mid_grade,
from {{ source('staging', 'prices') }},
unnest(json_extract_array(result, '$.cities')) city


