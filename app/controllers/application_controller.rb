class ApplicationController < ActionController::API
  private

  def authenticate!
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_auth_uid(current_auth_uid) unless current_auth_uid.nil?
  end

  def current_auth_uid
    # if your client sends a cookie named "authn" containing the access token
    # Keratin::AuthN.subject_from(cookies[:authn])
    # OR if your client uses localStorage and sends an Authorization header
    Keratin::AuthN.subject_from(request_bearer_token)
  end

  def request_bearer_token
    request.headers['Authorization'].to_s.sub(/^Bearer /, '').presence
  end
end
