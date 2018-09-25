view: opportunity {
  sql_table_name: PUBLIC.OPPORTUNITY ;;

  dimension: opportunity_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: acv {
    type: number
    sql: ${TABLE}."ACV" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: close_probability {
    type: string
    sql: ${TABLE}."CLOSE_PROBABILITY" ;;
  }

  dimension_group: closed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CLOSED_DATE" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATED_DATE" ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}."CUSTOMER_SEGMENT" ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}."FULL_NAME" ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}."STAGE_NAME" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_id, account_name, full_name, stage_name]
  }

  measure: total_acv {
    type: sum
    sql: ${acv} ;;
    value_format_name: usd
  }
}
