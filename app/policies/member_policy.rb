class MemberPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      if user.admin? # Assuming `admin` is a method that determines if a user is an admin
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def create?
    admin_officer? # Only admins and officers can create new members
  end

  def show?
    admin_officer_member_info? # Users can see their own profile
  end

  def update?
    admin_officer_member_info?
  end

  def destroy?
    user.admin? || record.id == user.id
  end

  def delete_confirmation?
    user.admin? || record.id == user.id
  end

  def admin_officer_member_info?
    user.admin? || user.officer? || record.id == user.id
  end

  def admin_officer?
    user.admin? || user.officer?
  end
end
