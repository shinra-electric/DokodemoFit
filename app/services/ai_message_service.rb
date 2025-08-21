# AiMessage.new(@message).call
class AiMessageService
    def initialize(message)
      @message = message
    end
  
    def call
      # call the ai and create the message here
      instructions = @message.ai_initial_prompt
      # No need for RubyLLM.chat anymore, we call ask directly on our Chat instance!
      @message.routine.with_instructions(instructions).ask(@message.content)
      # this knows my chat, it it know what a message is. so it's going to create BOTH messages for me
  
  
      # give it the persona / context / format
      # give it the task
      # response = chat
      # Message.create(role: 'assistant', content: response.content, chat: @message.chat)
    end
end