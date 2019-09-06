FactoryBot.define do
  factory :list do
    name { 'Lista 1' }
  end

  factory :task do
    description { 'Do something' }
    completed   { True }
  end

  factory :user do
    name     { "Juan" }
    email    { "camaney@gmail.com" }
    password { "123456" }
    description {'Admin'}
  end
end
