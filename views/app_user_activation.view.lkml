view: app_user_activation {
  sql_table_name: looker.app_user_activation ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.app_client_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      app_client.id,
      app_client.app_name,
      user.first_name,
      user.last_name,
      user.dev_mode_user_id,
      user.dev_branch_name
    ]
  }
}
