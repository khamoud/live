# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130826184436) do

  create_table "campaigns", :force => true do |t|
    t.integer  "budget"
    t.float    "conversion_rate"
    t.date     "end"
    t.float    "end_cpa"
    t.integer  "impressions"
    t.integer  "participants"
    t.float    "quoted_cpa"
    t.date     "start"
    t.integer  "total_actions"
    t.integer  "unique_visitors"
    t.float    "email_share_percent"
    t.float    "fb_share_percent"
    t.float    "fb_like_percent"
    t.float    "fb_comments_percent"
    t.float    "friends_invited_percent"
    t.float    "twitter_followers_percent"
    t.float    "twitter_shares_percent"
    t.float    "pins_percent"
    t.float    "pinterest_followers_percent"
    t.float    "tumblr_shares_percent"
    t.float    "tumblr_followers_percent"
    t.float    "page_likes_percent"
    t.integer  "page_likes"
    t.integer  "email_shares"
    t.integer  "fb_comments"
    t.integer  "fb_likes"
    t.integer  "fb_shares"
    t.integer  "friends_invited"
    t.integer  "pins"
    t.integer  "pinterest_followers"
    t.integer  "tumblr_shares"
    t.integer  "tumblr_followers"
    t.integer  "twitter_followers"
    t.integer  "twitter_shares"
    t.integer  "company_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "campaign_name"
  end

  add_index "campaigns", ["company_id"], :name => "index_campaigns_on_company_id"

  create_table "companies", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "username"
    t.integer  "user_level"
  end

  add_index "companies", ["email"], :name => "index_companies_on_email", :unique => true
  add_index "companies", ["reset_password_token"], :name => "index_companies_on_reset_password_token", :unique => true
  add_index "companies", ["username"], :name => "index_companies_on_username", :unique => true

end
