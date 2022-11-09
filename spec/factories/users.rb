FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '赤池' }
    first_name            { '克斗' }
    last_name_kana        { 'アカイケ' }
    first_name_kana       { 'カツト' }
    birth_date            { Faker::Date.birthday }
  end
end
