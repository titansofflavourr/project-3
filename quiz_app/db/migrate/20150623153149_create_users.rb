class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.boolean :is_instructor, null: false, default: false
    	t.string :f_name, null: false
    	t.string :l_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.boolean :is_active, null: false, default: false
    	t.timestamps
    end
  end
end
