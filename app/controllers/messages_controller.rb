class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_profile
  before_action :set_conversation
  
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(conversation_id: @conversation.id).order(created_at: :asc)
    @message = Message.new
  end
  
  # def new
  #   @message = Message.new
  # end
  
  def create

    # @conversation.messages.create(message_params)

    # redirect_to conversation_messages_path(@conversation)
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.sender = current_user
  
    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_messages_url, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to conversation_messages_url, notice: 'Message is empty!' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(current_user.id) if current_user.present?
    end

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:conversation_id, :sender_id, :content)
    end
end
