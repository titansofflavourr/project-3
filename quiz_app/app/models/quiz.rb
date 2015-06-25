# == Schema Information
#
# Table name: quizzes
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  instructions :string
#  is_active    :boolean          default(TRUE), not null
#  cohort_id    :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Quiz < ActiveRecord::Base
  belongs_to :user
	belongs_to :cohort
	has_many :questions
	belongs_to :user
end
