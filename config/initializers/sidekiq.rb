Sidekiq.configure_server do |config|
  config.redis = { namespace: "instabug-ramin0-#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "instabug-ramin0-#{Rails.env}" }
end
