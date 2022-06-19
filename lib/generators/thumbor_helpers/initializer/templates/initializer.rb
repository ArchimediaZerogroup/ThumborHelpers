ThumborHelpers.setup do |c|
  if ENV.key?("THUMBOR_SECURITY_KEY") and ENV.key?("THUMBOR_URL")
    c.server_url = ENV.fetch("THUMBOR_URL")
    c.security_key = ENV.fetch("THUMBOR_SECURITY_KEY")
    c.enabled = ENV.key?("THUMBOR_ENABLED")
  end
  c.image_root_host = ENV.fetch("SITE_IMAGE_ROOT_HOST", "http://0.0.0.0:3000")
end
