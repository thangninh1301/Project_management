FactoryBot.define do
  factory :admin, class: User do
    code { Faker::Base.regexify(/^B[0-9]{6}$/) }
    email { Faker::Internet.email }
    password { 'password' }
    before(:create, &:confirm)
  end

  factory :user, class: User do
    code { Faker::Base.regexify(/^B[0-9]{6}$/) }
    email { Faker::Internet.email }
    password { 'password' }
    before(:create, &:confirm)
  end
end
