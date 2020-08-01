FactoryBot.define do
  factory :test1, class: Matter do
    id { 1 }
    content { 'test1_content' }
    status { '未着手' }
    priority { 2 }
    latitude { 111 }
    longitude { 112 }
    remark { 'test_remark' }
    start_time { '2020_07_15' }
    end_time { '2020_07_30' }
    user_id { 1 }
  end

  factory :test2, class: Matter do
    id { 2 }
    content { 'test2_content' }
    status { '工事中' }
    priority { 0 }
    start_time { '2020_08_15' }
    end_time { '2020_08_30' }
  end

  factory :test3, class: Matter do
    id { 3 }
    content { 'test3_content' }
    status { '工事完了' }
    priority { 1 }
    start_time { '2020_08_15' }
    end_time { '2020_08_30' }
  end
end
