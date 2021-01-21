FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 2)}
    first_name            {"勇太"}
    family_name           {"田中"}
    first_name_kana       {"ユウタ"}
    family_name_kana      {"タナカ"}
    birthday              {"000000"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end