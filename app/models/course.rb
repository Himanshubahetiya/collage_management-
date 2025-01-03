class Course < ApplicationRecord
  
  def self.ransackable_attributes(auth_object = nil)
    super + ["course_name"]  
  end

  validates :course_name, uniqueness: true
end

