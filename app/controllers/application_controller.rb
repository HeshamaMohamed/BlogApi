class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_user

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

        @current_user_id = jwt_payload['id']
        @current_user = User.find(@current_user_id)
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        render :unauthorized
      end
    else
      render json: { errors: 'Login Required' }
    end
  end
end
