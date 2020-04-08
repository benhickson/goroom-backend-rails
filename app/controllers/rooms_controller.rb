class RoomsController < ApplicationController

	def new
		
	end

	def create
		# room = Room.create	# add the user id
		# redirect_to room
	end

	def show
		set_instance
		if @room
			# render normally
		else
			@attempted_name = params[:name]
			render :new
		end
	end

	private

	def set_instance
		if params[:name]
			@room = Room.find_by(closed_at: nil, name: params[:name])
		else
			@room = Room.new
		end
	end
end
