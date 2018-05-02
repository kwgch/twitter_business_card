Rails.application.config.middleware.use OmniAuth::Builder do
  p ENV['TWITTER_CONSUMER_KEY']
  p ENV['TWITTER_CONSUMER_SECRET']
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
end