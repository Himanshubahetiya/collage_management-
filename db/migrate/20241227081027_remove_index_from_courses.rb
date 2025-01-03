class RemoveIndexFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_index :courses, :account_id
  end
end