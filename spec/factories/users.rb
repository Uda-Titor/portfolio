FactoryBot.define do
  factory :sample, class: User do
    id { 1 }
    name { 'sample' }
    email { 'sample@example.com' }
    password { '00000000' }
  end
  factory :admin, class: User do
    id { 2 }
    name { 'admin' }
    email { 'admin@example.com' }
    password { '00000000' }
    admin { true }
  end
end
