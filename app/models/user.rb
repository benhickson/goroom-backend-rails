class User < ApplicationRecord
	has_secure_password :password, validations: false
	# If you don't use validations:false, has_secure_password defaults to validations:true,
	# which creates the following validations:
	#  - Password must be present on creation
	#  - Password length should be less than or equal to 72 bytes
	#  - Confirmation of password (using a XXX_confirmation attribute)
	# Since we are creating Users without passwords initially, and linking them to AnonymousUsers,
	# we must allow presence:false on the :password setter (targeting the password_digest field).

	has_one :anonymous_user

	has_many :rooms, foreign_key: 'creator_id'
	has_many :memberships
	has_many :groups, through: :memberships

	def open_rooms
		self.rooms.where('closed_at IS NULL')
	end

end
