class AddAssignedToQuiz < ActiveRecord::Migration
  def change
  	add_column :quizzes, :date_assigned, :date
  	add_column :quizzes, :total_points, :integer
  end
end
