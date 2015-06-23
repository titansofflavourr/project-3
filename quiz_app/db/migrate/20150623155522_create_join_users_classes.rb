class CreateJoinUsersClasses < ActiveRecord::Migration
  def change
    create_join_table :users, :classes do |t|
    	t.index :user_id
    	t.index :class_id
    end
  end
end
