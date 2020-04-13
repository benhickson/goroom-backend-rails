class RoomsController < ApplicationController

	def index
		render json: Room.open, status: :ok
	end
	
	# route disabled - use Angular
	# def new
	# end

	def create
		creator = @current_user
		room = Room.new(name: params[:name], creator: creator)
		if room.save
			render json: room, status: :ok
		else
			render json: {success: false, attempted_name: params[:name], message: room.errors.full_messages}, status: :conflict
		end
	end

	def show
		render json: Room.find(params[:id])
	end

	def update
		# change a room's name
		# currently anyone can do this - TODO: make this so that only people "in" the room can do this.
		room = Room.find(params[:id])
		room.update(name: params[:name])
		render json: room, status: :ok
	end

	def destroy
		# close a room
		# TODO: this should happen automatically after no activity
		room = Room.find(params[:id])
		room.update(closed_at: Time.now())
		if room.closed_at
			render json: {success: true, room_id: params[:id], message: 'room closed'}, status: :ok
		else
			render json: {success: false, room_id: params[:id], message: room.errors.full_messages}, status: :bad_request
		end
	end

	# route disabled because this is now happening in Angular
	# def join
	# 	@room = Room.find_by(closed_at: nil, name: params[:name])
	# 	if @room
	# 		# render normally
	# 	else
	# 		@attempted_name = params[:name]
	# 		render :new
	# 	end
	# end

end
