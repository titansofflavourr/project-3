class CreateAssessment < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
    	t.integer :user_id, null: false
    	t.integer :quiz_id, null: false
    	t.integer :student_score
    	t.string :comment
    	t.string :status, default: "completed"
    end
  end
end
