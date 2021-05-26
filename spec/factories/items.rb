FactoryBot.define do
  factory :item do
    product_name         {"ゲーム"}
    category_id          {2}
    price                {1000}
    product_description  {"PS5の新品"}
    product_condition_id {2}
    ship_base_id         {3}
    region_id            {20}
    ship_date_id         {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
