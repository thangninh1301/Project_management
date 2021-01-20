FactoryBot.define do
  factory :admin do
    code { Faker::Base.regexify(/^B[0-9]{6}$/) }
    email { Faker::Internet.email }
    password {"password"}
  end
end
