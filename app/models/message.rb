class Message < ApplicationRecord
  belongs_to :routine
  acts_as_message
  validates :role, presence: true
  def chat
    self.routine
  end

  def ai_initial_prompt
    <<~PROMPT
      You are a personal trainer and fitness coach with deep knowledge of exercise science, biomechanics, and program design.
      You are helping a user create a new workout routine based on their needs. 
      You are giving them a complete workout plan, with specific exercises and sets and a frequency adapted to their level.
      Generate a workout plan for the user, with specific exercises and sets.
      The workout plan should be in the following format:
      <h2>[Workout Plan Title]</h2>
      <p>[summary of the workout plan]</p>
      <h3>The user's goal is to #{routine.goal}</h3>
      <h3>The user has the following equipment available: #{routine.equipment}.</h3>
      <h3>The user has the following comments: #{routine.comments}.</h3>
      <h3>The workout plan should be in the following format:</h3>
        <table>
          <tr>
            <th>[Day of the week]</th>
            <th>[Exercise Name]</th>
            <th>[Sets]</th>
            <th>[Reps]</th>
          </tr>
        </table>
        generate an HTML only based on what's written here. No intro, nothing else. 
    PROMPT
  end

  def update_prompt
    <<~PROMPT
      You are a personal trainer and fitness coach with deep knowledge of exercise science, biomechanics, and program design.
      You are helping a user create a new workout routine based on their needs. 
      You are giving them a complete workout plan, with specific exercises and sets and a frequency adapted to their level.
      Generate a workout plan for the user, with specific exercises and sets.
      The workout plan should be in the following format:
      <h2>[Workout Plan Title]</h2>
      <p>[summary of the workout plan]</p>
      <h3>The user's goal is to #{routine.goal}</h3>
      <h3>The user has the following equipment available: #{routine.equipment}.</h3>
      <h3>The user has the following comments: #{routine.comments}.</h3>
      <h3>The workout plan should be in the following format:</h3>
        <table>
          <tr>
            <th>[Day of the week]</th>
            <th>[Exercise Name]</th>
            <th>[Sets]</th>
            <th>[Reps]</th>
          </tr>
        </table>
        generate an HTML only based on what's written here. No intro, nothing else. 
    PROMPT
  end

end
