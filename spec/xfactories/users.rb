FactoryBot.define do
 factory :user do
   name        { Faker::Name.name }
   email       { Faker::Internet.email }
   password    { Faker::Alphanumeric.alpha(number: 6) }
   description { Faker::Lorem.word }
 end
end
