class User < ApplicationRecord
	has_secure_password

	has_one :anonymous_user

	has_many :rooms
	has_many :memberships
	has_many :groups, through: :memberships
end
