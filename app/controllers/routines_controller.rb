class RoutinesController < ApplicationController

    def index
    @routines = current_user.routines.all
end

    def new
        @routine = current_user.routines.new
    end

    def create
        raise
        @routine = current_user.routines.new(routine_params)
        if @routine.save
            redirect_to routine_path(@routine)
        else
            render :new
        end
    end

    def show
        @routine = current_user.routines.find(params[:id])
    end

    def edit
        @routine = current_user.routines.find(params[:id])
    end

    def update
        @routine = current_user.routines.find(params[:id])
        if @routine.update(routine_params)
            redirect_to routine_path(@routine)
        else
            render :edit
        end
    end

    def destroy
        @routine = current_user.routines.find(params[:id])
        @routine.destroy
        redirect_to routines_path
    end
end

private

def routine_params 
    params.require(:routines).permit(:title,:goal, :equipment, :comments)
end