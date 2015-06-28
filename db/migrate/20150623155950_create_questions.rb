class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.integer :number
    	t.string :prompt, null: false
    	t.boolean :is_multiple_choice, null: false, default: false
    	t.string :answer_key
    	t.integer :max_points, null: false, default: 1
    	t.integer :quiz_id, null: false
    	t.timestamps
    end
  end
end
