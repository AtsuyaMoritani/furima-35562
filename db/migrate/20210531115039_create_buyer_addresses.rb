class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string     :postal_code
      t.integer    :region_id
      t.string     :city
      t.string     :address
      t.string     :building_name
      t.string     :phone_number,  null: false
      t.references :buyer,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
