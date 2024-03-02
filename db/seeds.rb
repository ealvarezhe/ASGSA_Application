# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[
  {
    name:"Admin",
    permissions: "Create, Read, Update, Delete"
  },
  {
    name:"Officer",
    permissions: "Create, Read, Update"
  },
  {
    name:"Member",
    permissions: "Read"
  }
].each do |role|
  Role.find_or_create_by(role)
end


# Member.create!([
#   { first_name: "Parker", last_name: "Johnson", email: "user1@tamu.edu", points: 10, position: "Vice President", date_joined: Time.current, degree: "MBA", food_allergies: "Gluten", res_topic: "Blockchain", res_lab: "Lab B", res_pioneer: "Pioneer K", res_description: "Project I", area_of_study: "Physics" },
#   { first_name: "Quinn", last_name: "Davis", email: "user2@tamu.edu", points: 10, position: "Member", date_joined: Time.current, degree: "MS", food_allergies: "Gluten", res_topic: "Cybersecurity", res_lab: "Lab I", res_pioneer: "Pioneer J", res_description: "Project A", area_of_study: "Sociology" },
#   { first_name: "Morgan", last_name: "Rodriguez", email: "user3@tamu.edu", points: 70, position: "Director", date_joined: Time.current, degree: "MD", food_allergies: "Peanuts", res_topic: "Data Science", res_lab: "Lab A", res_pioneer: "Pioneer C", res_description: "Project G", area_of_study: "Mathematics" },
#   { first_name: "Casey", last_name: "Williams", email: "user4@tamu.edu", points: 40, position: "President", date_joined: Time.current, degree: "MS", food_allergies: "Nuts", res_topic: "Cloud Computing", res_lab: "Lab B", res_pioneer: "Pioneer F", res_description: "Project F", area_of_study: "Philosophy" },
#   { first_name: "Casey", last_name: "Smith", email: "user5@tamu.edu", points: 80, position: "Advisor", date_joined: Time.current, degree: "MS", food_allergies: "Soy", res_topic: "Quantum Computing", res_lab: "Lab I", res_pioneer: "Pioneer E", res_description: "Project K", area_of_study: "Philosophy" },
#   { first_name: "Jamie", last_name: "Wilson", email: "user6@tamu.edu", points: 40, position: "Coordinator", date_joined: Time.current, degree: "BS", food_allergies: "Tree nuts", res_topic: "Cybersecurity", res_lab: "Lab E", res_pioneer: "Pioneer B", res_description: "Project D", area_of_study: "Physics" },
#   { first_name: "Riley", last_name: "Jones", email: "user7@tamu.edu", points: 80, position: "Intern", date_joined: Time.current, degree: "MA", food_allergies: "Dairy", res_topic: "Artificial Intelligence", res_lab: "Lab F", res_pioneer: "Pioneer D", res_description: "Project K", area_of_study: "Chemistry" },
#   { first_name: "Parker", last_name: "Johnson", email: "user8@tamu.edu", points: 100, position: "Intern", date_joined: Time.current, degree: "PhD", food_allergies: "Shellfish", res_topic: "Cybersecurity", res_lab: "Lab C", res_pioneer: "Pioneer H", res_description: "Project G", area_of_study: "Chemistry" },
#   { first_name: "Parker", last_name: "Rodriguez", email: "user9@tamu.edu", points: 40, position: "Intern", date_joined: Time.current, degree: "MA", food_allergies: "None", res_topic: "Cybersecurity", res_lab: "Lab A", res_pioneer: "Pioneer F", res_description: "Project G", area_of_study: "Chemistry" },
#   { first_name: "Jordan", last_name: "Brown", email: "user10@tamu.edu", points: 100, position: "President", date_joined: Time.current, degree: "MBA", food_allergies: "Tree nuts", res_topic: "Augmented Reality", res_lab: "Lab G", res_pioneer: "Pioneer K", res_description: "Project H", area_of_study: "Engineering" },
# ])