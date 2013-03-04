class CommentObserver < ActiveRecord::Observer
  observe :comment

  def after_create(record)
   # email_new_comment_to_post_subscribers(record)
   # email_new_comment_to_forum_subscribers(record)
  end

  private

  # Ideally once the task of sending email is delegated it should run asynchornously in background
  # Resque/Sidekiq

  # Emails the just created comment to all the subscriber subscribed of this (comment.post) post.
  def email_new_comment_to_post_subscribers(comment)
    SubscriptionMailer.notify_new_comment_creation(comment.post.subscribers.map(&:email), comment).deliver
  end

  # Emails the just created comment to all the subscriber subscribed to whole forum
  def email_new_comment_to_forum_subscribers(comment)
    SubscriptionMailer.notify_new_comment_creation(ForumSubscriber.all.map(&:email), comment).deliver
  end
  
end
