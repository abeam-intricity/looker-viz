view: sankey {
  sql_table_name: PUBLIC.SANKEY ;;

  dimension: constituent_id {
    type: string
    sql: ${TABLE}."CONSTITUENT_ID" ;;
  }

  dimension: contact_channel {
    type: string
    sql: ${TABLE}."CONTACT_CHANNEL" ;;
  }

  dimension_group: contact {
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
    sql: ${TABLE}."CONTACT_DATE" ;;
  }

  dimension: gift_type {
    type: string
    sql: ${TABLE}."GIFT_TYPE" ;;
  }

  dimension: response_channel {
    type: string
    sql: ${TABLE}."RESPONSE_CHANNEL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
