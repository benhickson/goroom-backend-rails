class RoomsController < ApplicationController

	def index
		render json: Room.open
	end
	
	# def new
	# end

	def create
		# TODO: add creator/creator_id via JWT
		creator = User.find(1)

		room = Room.new(name: params[:name], creator: creator)
		if room.valid?
			room.save
			render json: room
		else
			render json: {success: false, attempted_name: params[:name], message: room.errors.full_messages}
		end
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
