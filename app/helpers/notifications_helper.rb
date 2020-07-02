module NotificationsHelper
  def get_notifications
    if current_user.admin?
      @notifications = Notification.all.page(params[:page]).per(10)
    else
      @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    end
  end
end
