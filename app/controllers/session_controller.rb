class SessionController < ApplicationController
	skip_before_action :authenticate_user

	def login
		user = User.find_by(email: params[:email])

		if user&.authenticate(params[:password])
			token = JWT.encode({ user_id: user.id }, @secret_key, 'HS256')
			render json: { token: token, message: "Login Successfully" }, status: :ok
		else
			render json: { error: 'Invalid credentials' }, status: :unauthorized
		end
	end
end