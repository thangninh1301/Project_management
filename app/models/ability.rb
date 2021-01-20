# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, :create, :read, to: :crud
    can :crud, User if user.has_role? :admin
    can :read, :all
    return unless user.present?
  end
end
