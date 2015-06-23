class AddCommentToResponses < ActiveRecord::Migration
  def change
  	add_column :responses, :comment, :string
  end
end
