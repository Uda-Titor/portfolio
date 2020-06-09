FactoryBot.define do
  factory :matter do
      title { 'test_title' }
      content { 'test_content' }
      start_date { '2020-06-09' }
      completion_date { '2020-06-10' }
  end
end
