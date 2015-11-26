FactoryGirl.define do
  factory :user do
    nome        { Faker::Name.name }
    email       { Faker::Internet.email }
    password	{ Faker::Internet.password }
  end
end