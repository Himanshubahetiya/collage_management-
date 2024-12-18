# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin@example.com', password: 'Password@123', password_confirmation: 'Password@123') if Rails.env.development?

# db/seeds.rb

Role.find_or_create_by(name: 'student')
Role.find_or_create_by(name: 'faculty')

# Add example accounts
student_role = Role.find_by(name: 'student')
faculty_role = Role.find_by(name: 'faculty')

# Account.create!(email: 'student1@example.com', password: 'password123', role: student_role, student_name: 'don')
# Account.create!(email: 'faculty1@example.com', password: 'password123', role: faculty_role, faculty_name: 'Dr. Smith')
