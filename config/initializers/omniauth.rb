
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'fcfcd51ce40ceacdd6cf', '6fc8d7229027537ec1515caa13b7c1201e679b40'
end
