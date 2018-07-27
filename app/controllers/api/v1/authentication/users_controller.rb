class Api::V1::Authentication::UsersController < Api::V1::Authentication::BaseController
	def create
		@message = ""
		@success = true
		@user = User.new(user_params)
		if @user.save
			@message = "User created successfully"
			render 'signup'
		else
			@message = @user.errors.full_messages.join(",")
			@success = false
			render json: {success: @success, message: @message}
		end
	end

	def signin
		@user = User.find_by_email(params[:email])
		if @user.present?
			render json: {success: true, user: @user}
		else
			render json: {success: false, message: "User does not exist"}
		end
	end

	def update
	end

	private
	def user_params
		params[:user].permit(:email, :dt_uuid, :user_type_id, :first_name, :last_name, :account_status)
	end
end
