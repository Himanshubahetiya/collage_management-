class Account < ApplicationRecord
  belongs_to :role
  has_secure_password 

  # Allowable attributes for search
  def self.ransackable_attributes(auth_object = nil)
    ["email", "student_name", "faculty_name", "role_id","name" , ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["role"]
  end

  


  validates :name, uniqueness: true, if: :student_role?
  validates :name, presence: true, if: :faculty_role?

  # Check if the account has the role 'student'
  def student_role?
    role.present? && role.name == 'student'
  end

  # Check if the account has the role 'faculty'
  def faculty_role?
    role.present? && role.name == 'faculty'
  end
end
