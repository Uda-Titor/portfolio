module NotificationsHelper
  def get_notifications
    @notifications = if current_user.admin?
                       Notification.all.page(params[:page]).per(10)
                     else
                       current_user.passive_notifications.page(params[:page]).per(10)
                     end
  end
end
