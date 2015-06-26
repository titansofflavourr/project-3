# == Schema Information
#
# Table name: questions
#
#  id                 :integer          not null, primary key
#  number             :integer          not null
#  prompt             :string           not null
#  is_multiple_choice :boolean          default(FALSE), not null
#  answer_key         :string
#  max_points         :integer          default(1), not null
#  quiz_id            :integer          not null
#  created_at         :datetime
#  updated_at         :datetime
#

class Question < ActiveRecord::Base

	belongs_to :quiz
	has_many :choices
	has_many :responses

end
