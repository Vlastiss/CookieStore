class CreateDeliveryOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :delivery_options do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
