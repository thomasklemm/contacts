OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # FIXME: Extract into environment variables, eg with Figaro
  provider :facebook, '582120878477078', '470988367a07230a6093abe3b0c35778'
end
