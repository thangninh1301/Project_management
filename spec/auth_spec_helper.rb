module AuthSpecHelper
  def login(user)
    post api_v1_user_session_path, params: { email: user.email, password: user.password }.to_json,
         headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  #auth_params_from_login_response_headers
  def auth_params(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    {
        'access-token' => token,
        'client' => client,
        'uid' => uid,
        'expiry' => expiry,
        'token-type' => token_type
    }
  end

  def logout
    delete destroy_api_v1_user_session_path
  end
end
