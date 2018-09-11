connection: "snowflake_viz"

# include all the views
include: "*.view"

datagroup: looker_viz_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_viz_default_datagroup

explore: constituents {}

explore: opportunity {}
