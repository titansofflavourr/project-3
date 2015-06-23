class User < ActiveRecord::Base

	has_and_belongs_to_many :classes
	has_many :responses

end