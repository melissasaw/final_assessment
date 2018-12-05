FactoryBot.define do
  factory :user do
    first_name { "Melissaaaaa" }
    last_name {"Sawwwwww"}
    email { "melissasawww@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end

  factory :user1 do
    first_name { "Ben" }
    first_name { "Saww" }
    email { "benben@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
