class User < ActiveRecord::Base

	validates :email, uniqueness: true
	# DHH <3's Coda
	has_secure_password

	has_and_belongs_to_many :classes
	has_many :responses

end