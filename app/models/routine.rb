class Routine < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :exercises, through: :routine_exercises
  has_many :routine_exercises, dependent: :destroy

  validates :title, presence: true
  validates :goal, presence: true


  def ai_prompt
    <<~PROMPT
      You are a personal trainer and fitness coach with deep knowledge of exercise science, biomechanics, and program design.
      You are helping a user create a new workout routine based on their needs. 
      You are giving them a complete workout plan, with specific exercises and sets and a frequency adapted to their level.
      Generate a workout plan for the user, with specific exercises and sets.
      The workout plan should be in the following format:
      <h2>[Workout Plan Title]</h2>
      <p>[summary of the workout plan]</p>
      <h3>The user's goal is to #{user.goal}</h3>
      <h3>The user has the following equipment available: #{user.equipment}.</h3>
      <h3>The user has the following comments: #{user.comments}.</h3>
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
#nothing here
end
