class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
    	t.integer :question_id, null: false
    	t.string :option, null: false
    	t.string :key, null: false
    end
  end
end
