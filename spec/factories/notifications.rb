FactoryBot.define do
  factory :notification do
    id { 1 }
    visitor_id { 1 }
    visited_id { 2 }
    matter_id { 1 }
    comment_id { 1 }
    action { 'comment' }
    checked { false }
    admin_checked { false }
  end
end
