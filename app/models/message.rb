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
      <h4>The user's goal is to #{routine.goal}</h3>
      <h4>The user has the following equipment available: #{routine.equipment}.</h3>
      <h4>The user has the following comments: #{routine.comments}.</h3>
      
        generate an HTML only with some BS 5.3 styling based on what's written here. No intro, nothing else. 
        generate an HTML only based on what's written here. No intro, nothing else. 
      I want it to look like this : 

    <div class="container">
      <h1><%= @routine.title %></h1>
      <p>Goal: <%= @routine.goal %></p>

  <div class="mt-4 mb-4">
    <h3>Summary</h3>
    <p>Exercises targeting all the body groups with a mix of resistance and HIIT training.</p>
  </div>

  <div>
  <h4>Available Equipment</h4>
  <p><%= @routine.equipment.present? ? @routine.equipment : "None"%></p>
  </div>

  <div class="mt-4 mb-4">
    <h4 class="mt-2 mb-3">Workout Routine</h4>

    <div class="accordion mb-4" id="accordionExample">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingOne">
          <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            Description
          </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            This full body routine incorporates cardio, resistance training, and HIIT targeting all muscle groups. It's designed to use your body weight to train and no equipment is needed. The workout routine will test your mental grit as well as your physical limits.
          </div>
        </div>
      </div>
    </div>

    <table class="table table-bordered table-striped">
      <thead class="thead-dark">
        <tr>
          <th>Day</th>
          <th>Workout</th>
          <th>Details</th>
          <th>Duration</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Day 1</td>
          <td>Long Run</td>
          <td>
            <ul>
              <li>10km</li>
              <li>Normal Pace</li>
            </ul>
          </td>
          <td>60 min</td>
        </tr>
        <tr>
          <td>Day 2</td>
          <td>Leg Workout</td>
          <td>
            <ul>
              <li><b>Squats</b> 50 × 4 sets</li>
              <li><b>Barbell Lunges</b> 50 × 4 sets</li>
              <li><b>Burpees</b> 25 × 4 sets</li>
            </ul>
          </td>
          <td>30 min</td>
        </tr>
        <tr>
          <td>Day 3</td>
          <td>Interval Running</td>
          <td>
            <ul>
              <li>1 minute sprints</li>
              <li>4 minute light jog</li>
              <li>30 minute run</li>
            </ul>
          </td>
          <td>30 min</td>
        </tr>
        <tr>
          <td>Day 4</td>
          <td>Full Body Workout</td>
          <td>
            <ul>
              <li><b>Push-ups</b> 20 × 5 sets</li>
              <li><b>Pull-ups 10</b></li>
              <li><b>Sit-ups</b> 50 × 4 sets</li>
              <li><b>Squats</b> 50 × 4 sets</li>
            </ul>
          </td>
          <td>45 min</td>
        </tr>
        <tr>
          <td>Day 5</td>
          <td>Long Run</td>
          <td>
            <ul>
              <li>16km</li>
              <li>Normal Pace</li>
            </ul>
          </td>
          <td>90 min</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div>
    <div class="accordion mb-4" id="accordionExample">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingOne">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            Your Comments
          </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <%= @routine.comments %>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>"
PROMPT
  end

  def update_prompt
    <<~PROMPT
      You are a personal trainer and fitness coach with deep knowledge of exercise science, biomechanics, and program design.
      
      We already created an HTML workout plan, please find it here: #{routine.messages.where(role: 'assistant').last&.content}
      
      The user has the following comments on the page content, please find them here: #{routine.messages.where(role: 'user').last&.content}
      
      Please update the workout plan according to the user's comments while keeping the same structure and HTML format.
      Generate an updated HTML workout plan with the same styling and layout, incorporating the user's feedback.
      Return only the HTML content, no additional text or explanations.
    PROMPT
  end

end
