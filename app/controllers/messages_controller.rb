class MessagesController < ApplicationController
    
  def create
    @routine = Routine.find(params[:routine_id])
    @message = Message.new(message_params)
    @message.role = 'user'
    @message.routine = @routine
    if @message.valid?
      # TODO: Have the AI to answer this message
      AiMessageService.new(@message).call
      # redirect_to routine_path(@routine)
      # we want to get just the last two messages create, and insert them on the page
      # Find the messages div
      # insert those last two message in there
      # (refresh the form)
      # let the default behavior, render "create.turbo_stream.erb"
    else
      render 'routines/show', status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
