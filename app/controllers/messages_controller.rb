class MessagesController < ApplicationController

  def create
    @routine = Routine.find(params[:routine_id])
    @message = Message.new(message_params)
    @message.routine = @routine
    @message.role = "user"
    if @message.save
      @response = RubyLLM.chat.with_instructions(@message.build_prompt).ask(@message.content)
      Message.create(role: "assistant", content: @response.content, routine: @routine)
      redirect_to routine_path(@routine)
    else
      render "routines/show", status: :unprocessable_content
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
