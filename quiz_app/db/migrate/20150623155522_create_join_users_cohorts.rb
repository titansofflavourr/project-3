class CreateJoinUsersCohorts < ActiveRecord::Migration
  def change
    create_join_table :users, :cohorts do |t|
    	t.index :user_id
    	t.index :cohort_id
    end
  end
end
