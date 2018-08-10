
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'fe3818932ea6a8301c99', '6375ea4e603f0dff1028e6228f31fc32cdd42c7a'
end
