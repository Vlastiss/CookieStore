class ModifyOrderItemsForBoxes < ActiveRecord::Migration[8.0]
  def change
    # Remove the direct cookie reference since boxes contain multiple cookies
    remove_foreign_key :order_items, :cookies
    remove_column :order_items, :cookie_id, :bigint
    
    # Remove quantity since each order_item represents one box
    remove_column :order_items, :quantity, :integer
    
    # Add box-specific columns
    add_column :order_items, :box_size, :string, null: false
    add_column :order_items, :box_price, :decimal, precision: 10, scale: 2
  end
end
