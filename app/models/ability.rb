# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      can :read, [Author, Book, Category, Delivery, Image]
      can :update, [Book]
      can :read, [Review]
      can :create, [Review]
      can %i[read create update], [Order, Address, CreditCard], user_id: user.id
      can :manage, [OrderItem]
      can :manage, [User], id: user.id
    else
      can :read, [Review]
      can :read, [Author, Book, Category]
      can :manage, [OrderItem]
    end
  end
end
