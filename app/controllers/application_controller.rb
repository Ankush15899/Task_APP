class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, unless: :json_request?
	before_action :set_secret_key
	before_action :authenticate_user

	#making unauthorized method
	def render_unauthorized
    render json: { error: 'You are not authorized to perform this action' }, status: :unauthorized
  end

  private

  def authenticate_user
    # Extract the token from the Authorization header
    token = request.headers['Authorization']&.split(' ')&.last

    if token
      begin
        # Decode the token using the secret key
        decoded_token = JWT.decode(token, @secret_key, true, algorithm: 'HS256')
        user_id = decoded_token.first['user_id']
        @current_user = User.find_by(id: user_id)
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Missing token' }, status: :unauthorized
    end
  end

	def set_secret_key
		@secret_key = Rails.application.credentials.secret_key_base
	end

	protected
	def json_request?
    request.format.json?
  end
end
