require 'rails_helper'
include ActionController::RespondWith

describe 'User', type: :request do
  let!(:admin) do
     create :admin
     User.find_by(email: admin.email).confirm
  end
  it "sdfsf" do
    login(admin)
    expect(response.body).to eq(User.last.id)
  end
end
