class UsersController < ApplicationController

	skip_before_action :authenticate_request, only: [:anon]

	# return details about a particular user
	def show
		user = User.find(params[:id])
		render json: {
			id: user.id,
			display_name: user.display_name,
			anon_display_name: user.anon_display_name
		}, status: :ok
	end

	def current
		user = @current_user
		render json: {
			id: user.id,
			email: user.email,
			display_name: user.display_name,
			anon_display_name: user.anon_display_name
		}, status: :ok

		# log the connection
		Connection.create(user: user, ip_address: request.remote_ip)
	end
	
	# create/register a user
	def create
		# transition anonymous account to full account
		updateStatus = @current_user.update(email: params[:email], display_name: params[:display_name], password: params[:password])
		if updateStatus
			# delete the associated anonymous user
			@current_user.anonymous_user.destroy
			render json: {status: 'User created successfully'}, status: :created
		else
			render json: {errors: @current_user.errors.full_messages}, status: :conflict
		end
	end

	# login a user
	def login
		if @current_user.anonymous_user
			# remove anonymous user data - disabled for now... we might want to track things somehow... merging the users' data
			# @current_user.anonymous_user.destroy
			# @current_user.destroy
		end

		# get a user by the email supplied
		user = User.find_by(email: params[:email].to_s.downcase)
		# check that the user exists and the pasword is correct
		if user && user.authenticate(params[:password])
			render json: {auth_token: JsonWebToken.encode({user_id: user.id})}, status: :ok
		else
			render json: {error: 'Invalid email or password'}, status: :unauthorized
		end
	end

	# create and login an anonymous user
	def anon
		new_anon_user = User.create
		AnonymousUser.create(display_name: AnonymousUser.random_name, user: new_anon_user)
		render json: {auth_token: JsonWebToken.encode({user_id: new_anon_user.id})}, status: :ok
	end

end