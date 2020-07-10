module ApplicationHelper
  def set_image(icon, default)
    icon.attached? ? icon : default
  end
end
