class PostObserver < ActiveRecord::Observer
  observe :post

  def after_create(record)
    email_new_post_to_subscribers(record)
    #subscribe_to_the_new_post_just_created(record)
  end

  private

  # Emails the just created post to all the subscriber subscribed to whole forum
  def email_new_post_to_subscribers(record)
    # .all will lead to memory overflow over the time. Find in batches for better performance. Comeback later
    ForumSubscriber.all.each do |sub|
      SubscriptionMailer.notify_new_post_creation(sub.email, record).deliver
    end

    # SubscriptionMailer.notify_new_post_creation(ForumSubscriber.all.map(&:email), record).deliver
  end

  # Subscribes all the forum subscriber to the just created post (As forum subscriber are secrelty subscribed to all posts)
  def subscribe_to_the_new_post_just_created(record)
    record.subscribers << ForumSubscriber.all
  end
  
end
