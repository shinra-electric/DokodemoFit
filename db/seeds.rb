require 'open-uri'
puts "Cleaning the DB...."
User.destroy_all
Routine.destroy_all
RoutineExercise.destroy_all
Message.destroy_all
Exercise.destroy_all

puts "Creating a few users.... \n"
user1 = User.new(email: "grandma@mail.com", password: "jdhvgsg", username: "Grandma", body_type: "ectomorph", weight: 56.5, year_of_birth: 1939, gender: "female")
user2 = User.new(email: "tommy@mail.com", password: "hdfggsf", username: "Little Tommy Drop-table", body_type: "mesomorph", weight: 62.5, year_of_birth: 2015, gender: "male")
user3 = User.new(email: "butch@mail.com", password: "gsdgthrt", username: "Butch Kick-ass", body_type: "endomorph", weight: 96.5, year_of_birth: 1995, gender: "male")

user1.save!
user2.save!
user3.save!
puts "Created #{User.count} users"

puts "Creating a few exercises.... \n"
exercise1 = Exercise.new(name: "push-up", description: "Get down on your knees...")
exercise2 = Exercise.new(name: "pull-up", description: "Grab it and pull")
exercise3 = Exercise.new(name: "Touch your Toes", description: "Drop the soap")

exercise1.save!
exercise2.save!
exercise3.save!
puts "Created #{Exercise.count} exercises"

puts "Creating a routine"
routine1 = Routine.new(title: "My First Routine", goal: "To lose weight")
routine1.user = user1
routine1.save!

puts "Creating a couple of messages"
message1 = Message.new(content: "Blah blah blah", role: "assistant")
message1.routine = routine1
message2 = Message.new(content: "Blah blah blah", role: "user")
message2.routine = routine1
message1.save!
message2.save!

