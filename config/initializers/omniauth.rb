Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Settings.oauth.google_client_id, Settings.oauth.google_client_secret,
    {
      :name   => "google",
      :scope  => "email, profile",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }

end