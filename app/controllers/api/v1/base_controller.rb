class Api::V1::BaseController < ApplicationController
	 before_action :authenticate

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {errors: 'Not found'  }, status: 404
  end

  def destroy_session
    request.session_options[:skip] = true
  end

  protected
    def authenticate
      @current_user || render_unauthorized
    end

    def render_unauthorized
      render json: 'Not Authorized', status: 401
    end
end