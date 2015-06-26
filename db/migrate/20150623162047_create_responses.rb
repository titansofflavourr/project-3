class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
    	t.integer :user_id, null: false
    	t.integer :question_id, null: false
    	t.string :answer
    	t.integer :grade
    	t.string :comment
    	t.timestamps
    end
  end
end
