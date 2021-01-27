require 'rails_helper'

describe 'User', type: :request do
  include ActionController::RespondWith
  let(:admin) { create :admin }
  let!(:user) { create :user }
  let(:user_data) {build :user}
  context "when user logged in with admin user" do
    before do
      login(admin)
      admin.add_role :admin
    end
    it "should return list user (index)" do
      get api_v1_users_path, headers: auth_params(response)
      expect(response).to have_http_status 200
      expect(JSON.parse(response.body).to_s).to include(admin.email)
      expect(JSON.parse(response.body).to_s).to include(user.email)
    end
    it "should create user (create)" do
      expect do
        post "/api/v1/users", params: user_params(user_data), headers: auth_params(response)
      end
          .to change(User, :count).by eq(1)
      expect(response.body.to_s).to include("an email had send to ")
    end

    it "should get admin (show)" do
        get "/api/v1/users/#{admin.id}", headers: auth_params(response)
        expect(response).to have_http_status 200
        expect(JSON.parse(response.body).to_s).to include(admin.email)
    end

    it "should update user (create)" do
      user['contract_type'] = 'part-time'
      user['position'] = 'ceo'
      expect do
        put "/api/v1/users/#{user.id}", params: user_params(user), headers: auth_params(response)
      end
          .to change(User.count).from(nil).to('ceo')

    end
  end

  private

  def user_params user
    {
        "email" => user.email,
        "password" => user.password,
        "code" => user.code
    }
  end


end
