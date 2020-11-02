class CreateOrderAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_addresses do |t|
      t.string :post_number, null: false
      t.integer :home_prefecture_id, null: false
      t.string :home_town, null: false
      t.string :home_address, null: false
      t.string :building
      t.string :phone_number,null: false
      t.references :order, foreign_key: true
      
      t.timestamps
    end
  end
end
