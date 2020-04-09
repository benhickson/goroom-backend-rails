class UsersController < ApplicationController

	def show
		set_instance
		render json: {
			id: @user.id, 
			email: @user.email,
			rooms: @user.open_rooms.select(:id, :name)
		}
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