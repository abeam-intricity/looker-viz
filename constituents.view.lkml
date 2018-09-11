view: constituents {
  sql_table_name: PUBLIC.CONSTITUENTS ;;

  dimension: activism_type {
    type: string
    sql: ${TABLE}."ACTIVISM_TYPE" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

  dimension: communication_type {
    type: string
    sql: ${TABLE}."COMMUNICATION_TYPE" ;;
  }

  dimension: congressional_district {
    type: string
    sql: ${TABLE}."CONGRESSIONAL_DISTRICT" ;;
  }

  dimension: constituent {
    type: string
    sql: ${TABLE}."CONSTITUENT" ;;
  }

  dimension: constituent_city {
    type: string
    sql: ${TABLE}."CONSTITUENT_CITY" ;;
  }

  dimension: constituent_state {
    type: string
    sql: ${TABLE}."CONSTITUENT_STATE" ;;
  }

  dimension: constituent_zip {
    type: string
    sql: ${TABLE}."CONSTITUENT_ZIP" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: donation_amt {
    type: number
    sql: ${TABLE}."DONATION_AMT" ;;
  }

  dimension: donation_type {
    type: string
    sql: ${TABLE}."DONATION_TYPE" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: is_activist {
    type: yesno
    sql: ${TABLE}."IS_ACTIVIST" ;;
  }

  dimension: is_donor {
    type: yesno
    sql: ${TABLE}."IS_DONOR" ;;
  }

  dimension: test_response {
    type: string
    sql: ${TABLE}."TEST_RESPONSE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
