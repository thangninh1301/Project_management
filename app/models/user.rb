# frozen_string_literal: true

class User < ActiveRecord::Base
  rolify
  after_create :add_admin_role

  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :code, presence: true, uniqueness: true,
                   format: { with: /\AB[0-9]{6}\z/i,
                             message: 'please enter code in correct format' }

  private

  def add_admin_role
    add_role :admin if User.count == 1
    add_role :user
  end
end
