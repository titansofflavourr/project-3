class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
    	t.integer :course_id, null: false
    	t.string :name
    	t.date :start_date, null: false
    	t.date :end_date, null: false
    	t.boolean :is_active, null: false, default: true
    	t.timestamps
    end
  end
end
