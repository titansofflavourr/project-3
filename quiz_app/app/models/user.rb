class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :database_authenticatable, :validatable, :confirmable, :registerable,:recoverable, :rememberable, :trackable,
  devise :invitable
  

	validates :email, uniqueness: true
	# DHH <3's Coda
	has_secure_password

	has_and_belongs_to_many :classes
	has_many :responses

	
end