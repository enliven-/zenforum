class PostsSubscribersJoinTable < ActiveRecord::Migration
  def change
  	create_table :posts_subscribers do |t|
      t.integer :post_id
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
