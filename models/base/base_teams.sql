{{ config(
    materialized = 'view',
    schema = 'base'
) }}

with source as (
    select *
    from read_parquet('s3://yshen-nba-data-lake/bronze/nba/teams/source=nba_api/season=2024-25/ingest_ts=2025-11-07T00-01-28Z/*.parquet')
),

renamed as (
    select
        id as team_id,
        full_name as team_full_name,
        abbreviation as team_abbreviation,
        nickname as team_nickname,
        city as team_city,
        state as team_state,
        year_founded
    from source
)

select * from renamed;