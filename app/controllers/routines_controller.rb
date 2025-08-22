class RoutinesController < ApplicationController

    def index
    @routines = current_user.routines
    @routine = Routine.new
    end

    def create
        @routine = Routine.new(routine_params)
        @routine.user = current_user
        @routine.save!
        if @routine.save
            @message = Message.new({content: ""})
            @message.role = 'user'
            @message.routine = @routine
            if @message.valid?
              # TODO: Have the AI to answer this message
              AiInitialPromptService.new(@message).call
            end

            redirect_to routine_path(@routine)
        else
            render :new
        end
    end

    def show
      @image = ["running.gif", "squat.gif", "skipping.png", "big_curl.gif","big_curling.gif", "big_curl2.png", "dumbell_pose.png"]
      @routine = Routine.find(params[:id])
      redirect_to root_path unless @routine.user = current_user
    end

    def edit
      @routine = Routine.find(params[:id])
      redirect_to root_path unless @routine.user = current_user
    end

    def update
        @routine = Routine.find(params[:id])
        if @routine.update(routine_params)
            @message = Message.new({content: ""})
            @message.role = 'user'
            @message.routine = @routine
            UpdatePromptService.new(@message).call
            redirect_to routine_path(@routine)
        else
            render :edit
        end
    end

    def destroy
      @routine = Routine.find(params[:id])
      redirect_to root_path unless routine.user = current_user
      @routine.destroy
      redirect_to routines_path
    end
end

private

def routine_params
    params.require(:routine).permit(:title, :goal, :equipment, :comments)
end
