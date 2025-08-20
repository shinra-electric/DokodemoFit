require "open-uri"
require "nokogiri"

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

puts "Getting scraping data"
url = "https://www.simplyfitness.com/pages/workout-exercise-guides"

html_file = URI.parse(url).read
html_doc = Nokogiri::HTML.parse(html_file)

ul_lists = html_doc.search(".exo-ol")
exercise_paths = ul_lists.map do |list|
  list.children.children.map { |li| li.attribute_nodes.first.value }
end

exercise_urls = exercise_paths.flatten.map do |exercise_path|
  "https://www.simplyfitness.com#{exercise_path}"
end

exercise_urls.each do |exercise_url|
    puts "Creating an exercise..."
  exercise_file = URI.parse(exercise_url).read
  exercise_doc = Nokogiri::HTML.parse(exercise_file)

  p_items = exercise_doc.search("p").children.map { |p| p.text.strip }


  span_items = exercise_doc.search(".exo-info div span").children.map { |item| item.text.strip }

  img_src = exercise_doc.search("#PageContainer header .container img")

  name = exercise_doc.search("h1").text.strip
  starting_position = p_items[1]
  execution = p_items[2]
  description = "#{starting_position} #{execution}"
#   equipment_used = span_items[0]
  main_muscle_group = span_items[1]  
  img = img_src[0]["src"]

  new_exercise = Exercise.new(name: name, description: description, muscle_group: main_muscle_group, img_url: img)
  new_exercise.save!
end

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

join1 = RoutineExercise.new
join1.exercise = Exercise.first
join1.routine = routine1
join1.save!



