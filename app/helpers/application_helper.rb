module ApplicationHelper
  # Overwrite `current_user` helper of devise
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new name: "Guest", first_name: "Guest", last_name: "Guest"
  end
end
