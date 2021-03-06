require 'jwt'

class JsonWebToken

	# Encodes and signs JWT payload with expiration
	def self.encode(payload)
		payload.reverse_merge!(meta)
		JWT.encode(payload, ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base)
	end

	# Decodes the JWT with the signed secret
	def self.decode(token)
		JWT.decode(token, ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base)
	end

	# Validates the payload hash for expiration and meta claims
	def self.valid_payload(payload)
		if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
			return false
		else
			return true
		end
	end

	# Default options to be encoded in the token
	def self.meta
		{
			exp: 60.days.from_now.to_i,
			iss: 'goroom-api',
			aud: 'client'
		}
	end

	# Validates if the token is expired by the exp parameter
	def self.expired(payload)
		Time.at(payload['exp']) < Time.now
	end

end
