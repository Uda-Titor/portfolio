every 1.day, at: '11:00 am' do
  runner 'Matter.mail_check'
end

every 1.day, at: '11:00 am' do
  runner 'Notification.delete_check'
end
