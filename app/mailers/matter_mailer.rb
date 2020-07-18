class MatterMailer < ApplicationMailer
  def matter_mail(matter)
    @matter = matter
    mail to: 'example@mail.com', subject: '工事完了のお知らせ'
  end
end
