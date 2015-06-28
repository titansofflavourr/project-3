class ChangeAssessmentStatusDefault < ActiveRecord::Migration
  def change
  	remove_column :assessments, :status
  	add_column :assessments, :status, :string, default: "submitted"
  end
end
