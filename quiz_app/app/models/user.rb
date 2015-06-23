class User < ActiveRecord::Base

	validates :email, uniqueness: true
	# DHH <3's Coda
	has_secure_password

	has_many :classes

end