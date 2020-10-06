FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password
    password {password}
    password_confirmation {password}
    last_name {"広瀬"}
    first_name {"すず"}
    last_name_kana {"ヒロセ"}
    first_name_kana {"スズ"}
    birth_date {Faker::Date.in_date_period}
  end
end
