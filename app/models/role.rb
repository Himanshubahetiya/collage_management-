class Role < ApplicationRecord
# Allowable attributes for search
  def self.ransackable_attributes(auth_object = nil)
    ["email", "student_name", "faculty_name", "role_id","name" , ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["role"]
  end	
	has_many :accounts
end
