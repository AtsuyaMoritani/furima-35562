class ItemAddress
  include ActiveModel::Model
  attr_accessor  :buyer, :postal_code, :region_id, :city, :address, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :city
    validates :address
    validates :phone_number, format: /\A\d{10,11}\z/
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    BuyerAddress.create(postal_code: postal_code, region_id: region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end