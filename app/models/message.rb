class Message < ApplicationRecord
  belongs_to :routine
  validates :content, presence: true
  validates :role, presence: true

  def build_prompt
    <<~PROMPT
      You are a fitness coach.

      I am someone who wants to get fitter and healthier.

      Help me create a weekly fitness routine based on the equipment I have available and my goals.

      Answer concisely in markdown.

      Provide a summary of the workout routine, a description of the workout routine, the available equipment that is provided, and then the routine broken down day-by-day (1 week) with day, workout name, details of that workout, and estimated duration.
    PROMPT
  end

end
