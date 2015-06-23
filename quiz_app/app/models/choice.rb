# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  option      :string           not null
#  key         :string           not null
#

class Choice < ActiveRecord::Base

	belongs_to :question

end
