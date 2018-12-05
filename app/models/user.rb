class User < ApplicationRecord
	has_secure_password
	has_many :pokemons
	has_many :authentications, dependent: :destroy

	validates :first_name,:last_name,:email,:password, presence: true
	validates :email, uniqueness: true
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Invalid format.Please try again!" }


	def self.create_with_auth_and_hash(authentication, auth_hash)
	   user = self.create!(
	     first_name: auth_hash["info"]["name"],
	     email: auth_hash["info"]["email"],
	     coins: 200,
	     password: SecureRandom.hex(10)
	   )
	   user.authentications << authentication
	   return user
	 end

	 # grab google to access google for user data
	 def google_token
	   x = self.authentications.find_by(provider: 'google_oauth2')
	   return x.token unless x.nil?
	 end

end
