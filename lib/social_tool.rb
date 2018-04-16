module SocialTool
  class << self

    # Get the latest tweets with #rubyonrails
    def twitter_search
      client = twitter_connect
      client.search("#rubyonrails", result_type: "recent").take(6).collect do |tweet|
        "#{tweet.user.screen_name}: #{tweet.text}"
      end
    end

    private

    def twitter_connect
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV.fetch "TWITTER_CONSUMER_KEY"
        config.consumer_secret     = ENV.fetch "TWITTER_CONSUMER_SECRET"
        config.access_token        = ENV.fetch "TWITTER_ACCESS_TOKEN"
        config.access_token_secret = ENV.fetch "TWITTER_ACCESS_SECRET"
      end
    end
  end
end
