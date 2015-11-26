FactoryGirl.define do
  factory :post do
    nome        { Faker::Name.name } 
    content     { Faker::Internet.email } 

    trait :registered do
      user_id   { Faker::Number.number(1) }
      content   { Faker::Internet.email }  
    end
  end
end