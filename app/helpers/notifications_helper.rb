module NotificationsHelper
  def get_notifications
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
  end
end
