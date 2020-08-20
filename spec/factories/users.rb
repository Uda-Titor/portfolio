FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'user' }
    email { 'user@example.com' }
    password { '00000000' }
    phone_number { "09009090909" }
    user_place { 'ユーザーの住所' }
    remark { '備考です' }
  end
  factory :admin, class: User do
    id { 2 }
    name { 'admin' }
    email { 'admin@example.com' }
    password { '00000000' }
    admin { true }
  end
end
