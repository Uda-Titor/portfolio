module ApplicationHelper
  def set_image(image_url, default)
    image_url.present? ? image_url : default
  end
end
