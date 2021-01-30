require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  it 'should logged in and response include role' do
    headers = { 'ACCEPT' => 'application/json' }
    post '/api/v1/auth/sign_in', params: { email: 'admin@admin.com',
                                           password: 'password' }, headers: headers
    expect(response.body).to include('"roles":["admin","user"]')
  end
end
