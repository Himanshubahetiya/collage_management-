class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.date :dob
      t.string :email
      t.string :password
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
