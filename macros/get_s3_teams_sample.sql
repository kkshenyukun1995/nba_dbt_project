{% macro get_s3_teams_sample(bucket, path) %}

{% set query %}
    SELECT *
    FROM read_parquet('s3://' || '{{ bucket }}' || '/' || '{{ path }}' || '*')
    LIMIT 5;
{% endset %}

{% do run_query(query) %}

{% endmacro %}