class UsersController < ApiController

	def show
		set_instance
		render json: @user
	end

	private

	def set_instance
		if params[:id]
			@user = User.find(params[:id])
		else
			@user = User.new
		end
	end
end