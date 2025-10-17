class CreateCookies < ActiveRecord::Migration[8.0]
  def change
    create_table :cookies do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
