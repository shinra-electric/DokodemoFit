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
            redirect_to routine_path(@routine)
        else
            render :new
        end
    end

    def show
        @routine = Routine.find(params[:id])
        redirect_to root_path unless @routine.user = current_user
    end

    def edit
      @routine = Routine.find(params[:id])
      redirect_to root_path unless routine.user = current_user
    end

    def update
        @routine = Routine.find(params[:id])
        if @routine.update(routine_params)
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
