class Item < ApplicationRecord
  with_options presence: true do
  validates :product_name
  validates :category_id, numericality: { other_than: 1 } 
  validates :product_description
  validates :product_condition_id, numericality: { other_than: 1 } 
  validates :ship_base_id, numericality: { other_than: 1 } 
  validates :region_id, numericality: { other_than: 1 } 
  validates :ship_date_id, numericality: { other_than: 1 } 
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message: "Price is invalid. Input half-width characters"}
  validates :image
  end



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  #has_one :buyer
  has_one_attached :image
  belongs_to :category
  belongs_to :product_condition
  belongs_to :ship_base
  belongs_to :region
  belongs_to :ship_date

end
