desc "This task is called by the Heroku scheduler add-on"
task :notification_email => :environment do
  User.all.each do |user|
    usermailer = UserMailer.new
    usermailer.notification(user)
  end
 end

