class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def json_response(json, status)
    render json:, status:
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :bio, :photo, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :bio, :photo, :email, :password, :current_password)
    end
  end

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Unauthorized user' }, status: 401 unless @current_user
  end

end
