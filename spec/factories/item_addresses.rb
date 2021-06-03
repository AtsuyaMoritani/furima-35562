FactoryBot.define do
  factory :item_address do
    postal_code { '123-4567' }
    region_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08011112222' }
    token { 'test' }
  end
end
