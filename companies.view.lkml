view: companies {
  sql_table_name: PUBLIC.COMPANIES ;;

  dimension: company_name {
    type: string
    sql: ${TABLE}."COMPANYNAME" ;;
  }

  dimension: dollar_amount {
    type: string
    sql: ${TABLE}."DOLLARAMOUNT" ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}."PAYMENTTYPE" ;;
  }

  dimension: register {
    type: string
    sql: ${TABLE}."REGISTER" ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name]
  }
}
