class RemoveAccountIdFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :account_id, :bigint
  end
end