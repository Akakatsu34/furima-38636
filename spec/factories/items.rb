FactoryBot.define do
  factory :item do
    Faker::Config.locale = 'ja'
    name                  { Faker::Name.name }
    describe              { Faker::Lorem.sentence }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_charge_id    { 2 }
    ship_from_id          { 2 }
    delivery_duration_id  { 2 }
    price                 { 40000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
