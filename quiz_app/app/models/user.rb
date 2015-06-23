# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  is_instructor   :boolean          default(FALSE), not null
#  f_name          :string           not null
#  l_name          :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  is_active       :boolean          default(TRUE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

	validates :email, uniqueness: true
	# DHH <3's Coda
	has_secure_password

	has_and_belongs_to_many :classes
	has_many :responses

end
