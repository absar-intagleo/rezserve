class Api::V1::Authentication::UsersController < Api::V1::Authentication::BaseController
	before_action :validate_params, only: :update
	
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
		@user = User.find_by_dt_uuid(params[:user][:dt_uuid])
		if @user.update(user_params)
			render json: {success: true, user: @user.except(:created_at, :updated_at) }
		else
			render json: {success: false, message: @user.errors.full_messages.join(",")}
		end
	end

	private
	
	def user_params
		params[:user].permit(:email, :dt_uuid, :user_type_id, :first_name, :last_name, :account_status)
	end

	def validate_params
		error_messages = []
		error_messages << "Please provide dt_uuid" unless params[:user][:dt_uuid].present?
		render json: {success: false, message: error_messages.join(",")} and return if error_messages.present?
	end
end
