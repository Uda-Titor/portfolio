FactoryBot.define do
  factory :test1, class: Matter do
      title { 'test1_title' }
      content { 'test1_content' }
      status { '未着手' }
      priority { 2 }
  end

  factory :test2, class: Matter do
      title { 'test2_title' }
      content { 'test2_content' }
      status { '工事中' }
      priority { 0 }
  end

  factory :test3, class: Matter do
      title { 'test3_title' }
      content { 'test3_content' }
      status { '工事完了' }
      priority { 1 }
  end
end
