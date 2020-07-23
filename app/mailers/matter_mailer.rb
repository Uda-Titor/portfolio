class MatterMailer < ApplicationMailer
  def matter_mail(matter)
    @matter = matter
    mail to: @matter.user.email, subject: '工事完了のお知らせ'
  end
end
