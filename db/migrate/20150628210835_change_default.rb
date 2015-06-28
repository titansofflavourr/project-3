class ChangeDefault < ActiveRecord::Migration
  def change
  	change_column :assessments, :status, :string, default: "submitted"
  	change_column :questions, :number, :integer
  end
end



