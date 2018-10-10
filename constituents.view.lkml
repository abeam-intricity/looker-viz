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


  dimension: is_in_progress {
    type: yesno
    sql: ${age} < 50 ;;
  }

  dimension: loan_id {
    type: number
    sql: FLOOR(RANDOM()*(10000-10+1))+1000 ;;
  }

  dimension: sell_this_loan {
    type: string
    sql: CASE WHEN ${is_in_progress} THEN 'In Progress' ELSE 'Sell This Loan' END ;;
    link: {
      label: "Sell this loan"
      url: "https://debtx-sell-this-loan-env.us-east-1.elasticbeanstalk.com/{{_user_attributes['id']}}/{{constituents.loan_id._value}}/" #?session_key={{_user_attributes['session_key']}}"
      #url: "https://dxadev.debtx.com/dx-utils/sell-loan/{{_user_attributes['id'] | round:0}}/{{loan.loan_id._value}}?session_key={{_user_attributes['session_key']}}"
    }
    html: <span class="progress_button" style="font-family: Open Sans,Helvetica,Arial,sans-serif;
        font-size: 11px;
        font-weight: 700;
        text-decoration: none;
        background-color: #ce1126;
        color: white;
        padding: 0px 6px 1px 6px;
        border: 1px solid white;
        border-radius: 5px;
        cursor: default;
        text-align: center;
        display: {% if constituents.is_in_progress._value == 'Yes' %}inline{% else %}none{% endif %}">Sale Requested</span>
      <span class="sell_button" style="font-family: Open Sans,Helvetica,Arial,sans-serif;
        font-size: 11px;
        font-weight: 700;
        text-decoration: none;
        background-color: #003e7e;
        color: white;
        padding: 0px 6px 1px 6px;
        border: 1px solid white;
        border-radius: 5px;
        cursor: pointer;
        text-align: center;
        display: {% if constituents.is_in_progress._value == 'No' %}inline{% else %}none{% endif %}">Sell This Loan</span>
    ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_donation_amt {
    type: sum
    sql: ${donation_amt} ;;
    value_format_name: usd
  }
}
