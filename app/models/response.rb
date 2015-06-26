# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  question_id :integer          not null
#  answer      :string
#  grade       :integer
#  comment     :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Response < ActiveRecord::Base

	belongs_to :user
	belongs_to :question

end
