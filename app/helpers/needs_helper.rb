module NeedsHelper
  def active_staff(id)
     current_staff.role == "admin" || id == current_staff.id
  end
end
