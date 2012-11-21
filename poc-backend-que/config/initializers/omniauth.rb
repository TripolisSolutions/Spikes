OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "g215k34HdHnNTPFXtjn3Qw", "GodaLh8HbWuysUVxiGqYwuRPy8fRyhmyZAtqR1vGhxs"
end