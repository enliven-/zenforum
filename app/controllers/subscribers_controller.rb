class SubscribersController < ApplicationController

  def create

    if params[:post_subscriber]
      post_id = params[:post_subscriber][:post_id].to_i

      if subs = Subscriber.find_by_email(params[:post_subscriber][:email])

        if subs.is_a? PostSubscriber
          create_subs_post_association(subs, post_id)
          redirect_to post_path(post_id), notice: "#{subs.email} is already subscribed to post"
        else
          redirect_to post_path(post_id), notice: "#{subs.email} is already subscribed to forum"
        end

      else
        subs = PostSubscriber.create(params[:post_subscriber])
        create_subs_post_association(subs, post_id)
        redirect_to post_path(post_id), notice: "#{subs.email} subscribed to post"
      end

    end

    if params[:forum_subscriber]

      if subs = Subscriber.find_by_email(params[:forum_subscriber][:email])

        if subs.is_a? PostSubscriber
          subs.posts.clear
          subs.destroy
          subs = ForumSubscriber.create(params[:forum_subscriber])
          redirect_to posts_path, notice: "#{subs.email} subscribed to forum"
        else
          redirect_to posts_path, notice: "#{subs.email} is already subscribed to forum"
        end

      else
        subs = ForumSubscriber.create(params[:forum_subscriber])
        redirect_to posts_path, notice: "#{subs.email} subscribed to forum"
      end

    end

  end

  def destroy
    subs = Subscriber.find(params[:id])
    subs.destroy
    render text: 'deleted'
  end

  private

  def create_subs_post_association(subs, post_id)
    Post.find(post_id).subscribers << subs
  end
end
