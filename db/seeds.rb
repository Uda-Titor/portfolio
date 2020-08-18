5.times{
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false
              )
}



User.all.each do |user|
  user.matters.create!(
    content: 'やばいので来てください',
    status: '未着手',
    priority: 1,
    start_time: DateTime.new(2020,8,8,00,00,00),
    end_time: DateTime.new(2015,8,18,00,00,00)
  )
  user.matters.create!(
    content: '白線が消えています。',
    status: '未着手',
    priority: 1,
    start_time: DateTime.new(2020,9,8,00,00,00),
    end_time: DateTime.new(2020,9,19,00,00,00)
  )
  user.matters.create!(
    content: '土砂がやばいです',
    status: '工事中',
    priority: 2,
    start_time: DateTime.new(2020,7,8,00,00,00),
    end_time: DateTime.new(2020,7,19,00,00,00)
  )
end
