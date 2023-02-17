class ApplicationController < ActionController::Base

  # require "pp"
  # require "twitter"

  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['API_KEY']
    config.consumer_secret = ENV['API_KEY_SECRET']
    config.access_token = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  end

  # API制限を取得する
    # rate_limit_status = client.__send__(:perform_get, '/1.1/application/rate_limit_status.json')
    # p rate_limit_status[:resources][:search][:"/search/tweets"]
    # @limit = Time.at(rate_limit_status[:resources][:search][:"/search/tweets"][:reset])
end
