# == Schema Information
#
# Table name: cohorts
#
#  id         :integer          not null, primary key
#  course_id  :integer          not null
#  name       :string
#  start_date :date             not null
#  end_date   :date             not null
#  is_active  :boolean          default(TRUE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Cohort < ActiveRecord::Base
	has_many :quizzes
	belongs_to :course
	has_and_belongs_to_many :users

end
