class CreateBoxCookies < ActiveRecord::Migration[8.0]
  def change
    create_table :box_cookies do |t|
      t.references :order_item, null: false, foreign_key: true
      t.references :cookie, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
