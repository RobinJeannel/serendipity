class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def notifications(user)
    @user = user
    @url = 'serendpity.herokuapp.com'
    mail(to: @user.email, subject: 'New post on your followed communities')
  end
end
