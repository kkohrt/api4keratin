class ApplicationController < ActionController::API
  private

  def logged_in?
    !! current_user
  end

  def current_user
    @current_user ||= User.find_by_auth_uid(current_auth_uid) if current_auth_uid
  end

  def current_auth_uid
    # if your client sends a cookie named "authn" containing the access token
    # Keratin::AuthN.subject_from(cookies[:authn])
    Keratin::AuthN.subject_from(request_bearer_token)
    # OR if your client uses localStorage and sends an Authorization header
  end

  def request_bearer_token
    (request.headers['Authorization'] || '').sub(/^Bearer /, '')
  end
end
