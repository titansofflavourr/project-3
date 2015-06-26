class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	t.string :title, null: false
    	t.string :instructions
    	t.boolean :is_active, null: false, default: true
    	t.integer :cohort_id, null: false
    	t.integer :user_id, null: false
    	t.timestamps
    end
  end
end
