class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  before_action :set_profile
  
  # GET /conversations
  # GET /conversations.json
  def index
    as1 = Conversation.where(user1: current_user)
    as2 = Conversation.where(user2: current_user)
    @conversations = (as1 | as2)
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
    set_profile_test
  end
  
  # GET /conversations/1/edit
  def edit
  end
  
  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)
    @existing_convo = Conversation.where("user1_id = ? AND user2_id = ?", params[:conversation][:user1_id], params[:conversation][:user2_id]).first
    
    respond_to do |format|
      if @conversation.save
        @convo = Conversation.last[:id]
        format.html { redirect_to conversation_messages_path(@convo), notice: 'This is the beginning of the conversation.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { redirect_to conversation_messages_path(@existing_convo.id) }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(current_user.id) if current_user.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:user2_id, :user1_id)
    end
end
