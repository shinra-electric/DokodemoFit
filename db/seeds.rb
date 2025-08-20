require "open-uri"
require "nokogiri"
require "json"

puts "Cleaning the DB...."
Message.destroy_all
RoutineExercise.destroy_all
Routine.destroy_all
User.destroy_all
Exercise.destroy_all

puts "Creating a few users.... \n"
user1 = User.new(email: "grandma@mail.com", password: "jdhvgsg", username: "Grandma", body_type: "ectomorph", weight: 56.5, year_of_birth: 1939, gender: "female")
user2 = User.new(email: "tommy@mail.com", password: "hdfggsf", username: "Little Tommy Drop-table", body_type: "mesomorph", weight: 62.5, year_of_birth: 2015, gender: "male")
user3 = User.new(email: "butch@mail.com", password: "gsdgthrt", username: "Butch Kick-ass", body_type: "endomorph", weight: 96.5, year_of_birth: 1995, gender: "male")

user1.save!
user2.save!
user3.save!
puts "Created #{User.count} users"

filepath = File.join(__dir__, "data/exercises.json")
serialized_exercises = File.read(filepath)
exercises = JSON.parse(serialized_exercises)
Exercise.create(exercises)

puts "Created #{Exercise.count} exercises"

puts "Creating a routine"
routine1 = Routine.new(title: "My Full Body Routine", goal: "Lose weight")
routine1.user = user1
routine1.save!

puts "Creating a routine"
routine2 = Routine.new(title: "My Arm Routine", goal: "Arm strength")
routine2.user = user1
routine2.save!

puts "Creating a routine"
routine3 = Routine.new(title: "My Running Routine", goal: "Run a marathon in 4 months")
routine3.user = user1
routine3.save!

puts "Creating a couple of messages"
message1 = Message.new(content: "Blah blah blah", role: "assistant")
message1.routine = routine1
message2 = Message.new(content: "Blah blah blah", role: "user")
message2.routine = routine1
message1.save!
message2.save!

join1 = RoutineExercise.new
join1.exercise = Exercise.first
join1.routine = routine1
join1.save!

join2 = RoutineExercise.new
join2.exercise = Exercise.first
join2.routine = routine2
join2.save!

join3 = RoutineExercise.new
join3.exercise = Exercise.first
join3.routine = routine3
join3.save!
