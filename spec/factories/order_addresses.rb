FactoryBot.define do
  factory :order_address do
    Faker::Config.locale = 'ja'
    postal_code    { Faker::Address.postcode}
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { Faker::Address.city }
    house_number   { Faker::Address.street_address }
    building_name  { Faker::Address.street_name}
    phone_number   { '09012345678' }
  end
  end
end
