class RelationshipMailer < ActionMailer::Base
  def new_follower(user, follower)
    @user = user
    @follower = follower
    mail to: user.email, subject: 'あなたがフォローされました'
  end
end
