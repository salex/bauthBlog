class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :session_expiry

  def session_expiry
    if Current.session
      key = "#{Current.session.id}_expires_at"
      if session[key].present? && session[key] < Time.now
        terminate_session
        reset_session
        redirect_to root_path, flash: {alert: "Your session has expired!"}
      else
        session[key] = Time.now + 2.hours
      end
    end
  end

  def can?(action,model)
    Current.user && Current.user.can?(action,model)
  end
  helper_method :can?

  def flashit(msg=nil)
    if msg
      redirect_to dashboard_path, alert: msg
    else
      redirect_to dashboard_path, alert:"I'm sorry, Dave. I'm afraid I can't do that!"
    end
  end
  helper_method

end
