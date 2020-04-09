class RoomsController < ApplicationController

	def index
		render json: Room.open
	end
	
	def new
	end

	def create
		# room = Room.create	# add the user id
		# redirect_to room
	end

	def show
		render json: Room.find(params[:id])
	end

	def update
		room = Room.find(params[:id])
		room.update(name: params[:name])
		render json: room
	end

	def destroy
		room = Room.find(params[:id])
		room.update(closed_at: Time.now())
		if room.closed_at
			render json: {success: true, room_id: params[:id], message: 'room closed'}
		else
			render json: {success: false, room_id: params[:id], message: room.errors.full_messages}
		end
	end

	def join
		@room = Room.find_by(closed_at: nil, name: params[:name])
		if @room
			# render normally
		else
			@attempted_name = params[:name]
			render :new
		end
	end

end