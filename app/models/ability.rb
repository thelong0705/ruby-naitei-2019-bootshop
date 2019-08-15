# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    can :read, :all
    return unless user.has_role? :admin

    can :access, :rails_admin
    can :read, :dashboard
    can :manage, [User, Product, Category]
  end
end
