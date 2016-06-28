class StudentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.includes(:classroom).where(classrooms: { user_id: user.id })
    end
  end

  def create?
    true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.classroom.user == user
  end
end
