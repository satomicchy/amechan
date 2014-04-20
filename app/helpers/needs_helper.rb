module NeedsHelper
  def active_staff(id)
     current_staff.id == 1 || id == current_staff.id
  end
end
