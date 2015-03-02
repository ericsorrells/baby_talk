FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Name Number #{n}"}
    email { Faker::Internet.email }
    phone { Faker::Number.number(10) }
    password "foobar"
    password_confirmation "foobar"

    factory :admin, parent: :user do
      email "rgpass@gmail.com"
      admin true
    end

  end

  factory :question do
    sequence (1..50).to_a.sample
    content { Faker::Lorem.sentence(3) }
  end
end