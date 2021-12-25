class NotificationFromAdminMailer < ApplicationMailer
  def notify(user, msg)
    @msg = msg
    mail to: user.email, subject: 'infomation'
  end
end
