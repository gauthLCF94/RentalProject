class AppartementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    User.find_by(record.user_id) == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
