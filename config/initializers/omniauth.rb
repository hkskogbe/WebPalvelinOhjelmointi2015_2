Rails.application.config.middleware.use OmniAuth::Builder do
 provider :github, ENV['16c3748090ea9836cfc7'], ENV['0fa10ace64c45c9ead46008a3a84484542958e70']
end
