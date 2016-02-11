class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_users
  after_filter :set_csrf_cookie_for_ng

  #rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {errors: 'Not found'  }, status: 404
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  private

	def not_authenticated
	  redirect_to login_path, alert: "Please login first"
	end

	def current_users
  	User.current_users
	end

	def verified_request?
    # Rails 4.1
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    # Rails 4.2
    # super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end