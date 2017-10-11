connection: "thelook_snowflake"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


datagroup: change_Day {
  sql_trigger: SELECT CURRENT_DATE() ;;
}

explore: snowflake_orderitems {
  from: order_items

  join: orders {
    relationship: many_to_one
    sql_on: ${snowflake_orderitems.order_id}=${orders.id} ;;
  }

  join: inventory_items {
    relationship: many_to_one
    sql_on: ${snowflake_orderitems.inventory_item_id}=${inventory_items.Id} ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
  }
}
