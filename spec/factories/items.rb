FactoryBot.define do
  factory :item do
    product_name         {"ゲーム"}
    category_id          {"メンズ"}
    price                {"1000"}
    product_description  {"PS5の新品"}
    product_condition_id {"新品・未使用"}
    ship_base_id         {"着払い（購入者負担）"}
    region_id            {"北海道"}
    ship_date_id         {"1〜2日で発送"}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
