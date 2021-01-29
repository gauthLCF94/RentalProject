class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    record.user_id != user.id # true if user_id link to the appartement different from the id of the current user
  end

  def create?
    new?
  end

  def edit?
    record.user_id == user.id
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
