class Campaign < ActiveRecord::Base
  belongs_to :company
  attr_accessible :budget, :conversion_rate, :email_share_percent, :email_shares, :end, :end_cpa, :fb_comments, :fb_comments_percent, :fb_like_percent, :fb_likes, :fb_share_percent, :fb_shares, :friends_invited, :friends_invited_percent, :impressions, :page_likes, :page_likes_percent, :participants, :pins, :pins_percent, :pinterest_followers, :pinterest_followers_percent, :quoted_cpa, :start, :total_actions, :tumblr_followers, :tumblr_followers_percent, :tumblr_shares, :tumblr_shares_percent, :twitter_followers, :twitter_followers_percent, :twitter_shares, :twitter_shares_percent, :unique_visitors
  after_initialize :init


def init
  self.email_share_percent 			||= 0.1
  self.fb_share_percent 			||= 0.1
  self.fb_like_percent 				||= 0.32
  self.fb_comments_percent 			||= 0.1
  self.friends_invited_percent 		||= 0.1
  self.twitter_followers_percent 	||= 0.1
  self.twitter_shares_percent 		||= 0.1
  self.pins_percent 				||= 0.02
  self.pinterest_followers_percent  ||= 0.02
  self.tumblr_shares_percent 	 	||= 0.02
  self.tumblr_followers_percent	 	||= 0.02
  self.page_likes_percent		 	||= 0.0
end
	

def cost_per_email_share
   (self.budget * self.email_share_percent)/ self.email_shares
end

def cost_per_fb_share
   (self.budget * self.fb_share_percent)/ self.fb_shares
end

def cost_per_fb_like
   (self.budget * self.fb_like_percent)/ self.fb_likes
end

def cost_per_fb_comment
   (self.budget * self.fb_comments_percent)/ self.fb_comments
end

def cost_per_friend_invited
   (self.budget * self.friends_invited_percent)/ self.friends_invited
end

def cost_per_twitter_follower
   (self.budget * self.twitter_followers_percent)/ self.twitter_followers
end

def cost_per_twitter_share
   (self.budget * self.twitter_shares_percent)/ self.twitter_shares
end

def cost_per_pin
   (self.budget * self.pins_percent)/ self.pins
end

def cost_per_pinterest_follower
   (self.budget * self.pinterest_followers_percent)/ self.pinterest_followers
end

def cost_per_tumblr_share
   (self.budget * self.tumblr_shares_percent)/ self.tumblr_shares
end

def cost_per_tumblr_follower
   (self.budget * self.tumblr_followers_percent)/ self.tumblr_followers
end

def cost_per_page_like
   (self.budget * self.page_likes_percent)/ self.page_likes
end

end
