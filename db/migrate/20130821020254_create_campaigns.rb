class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :budget
      t.float :conversion_rate
      t.date :end
      t.float :end_cpa
      t.integer :impressions
      t.integer :participants
      t.float :quoted_cpa
      t.date :start
      t.integer :total_actions
      t.integer :unique_visitors
      t.float :email_share_percent
      t.float :fb_share_percent
      t.float :fb_like_percent
      t.float :fb_comments_percent
      t.float :friends_invited_percent
      t.float :twitter_followers_percent
      t.float :twitter_shares_percent
      t.float :pins_percent
      t.float :pinterest_followers_percent
      t.float :tumblr_shares_percent
      t.float :tumblr_followers_percent
      t.float :page_likes_percent
      t.integer :page_likes
      t.integer :email_shares
      t.integer :fb_comments
      t.integer :fb_likes
      t.integer :fb_shares
      t.integer :friends_invited
      t.integer :pins
      t.integer :pinterest_followers
      t.integer :tumblr_shares
      t.integer :tumblr_followers
      t.integer :twitter_followers
      t.integer :twitter_shares
      t.references :company

      t.timestamps
    end
    add_index :campaigns, :company_id
  end
end
