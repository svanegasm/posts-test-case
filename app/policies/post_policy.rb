# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  def index
    true
  end

  def new?
    true
  end

  def create?
    user.present?
  end

  def edit?
    user.present? && record.user == user
  end

  def update?
    user.present? && record.user == user
  end

  def destroy?
    user.present? && record.user == user
  end
end
