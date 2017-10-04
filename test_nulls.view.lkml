view: test_nulls {
  sql_table_name: PUBLIC.TEST_NULLS ;;

  dimension: foo {
    type: number
    sql: ${TABLE}.FOO ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
