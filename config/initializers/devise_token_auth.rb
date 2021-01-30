# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  config.token_cost = Rails.env.test? ? 4 : 10

  config.check_current_password_before_update = :password
  config.change_headers_on_each_request = false
  config.token_lifespan = 2.days
  config.batch_request_buffer_throttle = 5.seconds
  config.default_confirm_success_url = ENV["HOST"]
  config.default_password_reset_url = ENV["HOST"]
  config.enable_standard_devise_support = true
end
