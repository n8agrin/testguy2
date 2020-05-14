view: space_user {
  sql_table_name: looker.space_user ;;

  dimension: space_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.space_id ;;
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
      user.first_name,
      user.last_name,
      user.dev_mode_user_id,
      user.dev_branch_name,
      space.id,
      space.name
    ]
  }
}
