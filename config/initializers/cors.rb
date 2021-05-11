Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:8181'

    resource '*',
      headers: :any,
      credentials: true,
      expose: %w[access-token expiry token-type uid client],
      methods: %i[get post patch options delete put]
  end
end
