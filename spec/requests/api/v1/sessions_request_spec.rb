require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  let(:admin) { create :admin }
  it 'should logged in and include roles' do
    login(admin)
    expect(response.body).to include('"roles":["admin","user"]')
  end

  it 'should return 401 when not logged in' do
    logout
    expect(response.body).to include('User was not found or was not logged in.')
  end
end
