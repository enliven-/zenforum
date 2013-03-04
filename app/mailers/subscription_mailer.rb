class SubscriptionMailer < ActionMailer::Base
  default from: "furomhelp@gmail.com"

  def notify_new_post_creation(email, post)
  	@email = email
  	@post = post
  	mail(to: email, subject: "New post published")
  end

  def notify_new_comment_creation(email, comment)
  	@email = email
  	@comment = comment
  	mail(to: email, subject: "New comment published")
  end

end
