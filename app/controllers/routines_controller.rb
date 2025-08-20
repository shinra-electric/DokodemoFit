class RoutinesController < ApplicationController

    def index
    @routines = current_user.routines
end

    def new
        @routine = Routine.new
    end

    def create
        raise
        @routine = Routine.new(routine_params)
        @routine.user = current_user
        if @routine.save
            redirect_to routine_path(@routine)
        else
            render :new
        end
    end

    def show
        redirect_to root_path unless routine.user = current_user
        @routine = Routine.find(params[:id])
    end

    def edit
        redirect_to root_path unless routine.user = current_user
        @routine = Routine.find(params[:id])
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
        redirect_to root_path unless routine.user = current_user
        @routine = Routine.find(params[:id])
        @routine.destroy
        redirect_to routines_path
    end
end

private

def routine_params 
    params.require(:routines).permit(:title, :goal, :equipment, :comments)
end