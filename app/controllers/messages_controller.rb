class MessagesController < ApplicationController
    before_action :logged_in_user
    before_action :set_message, only: [:show, :edit, :update, :destroy, :read]
    
    def index
        @messages = Message.all #currently returning messages to all users
    end
    
    def outbox    
        @messages = current_user.messages
    end
    
    def new 
        @message = Message.new
    end
    
    def create
        @message = current_user.messages.build(message_params)
        respond_to do |format|
          if @message.save
            format.html { redirect_to @message, notice: 'Message was successfully created.' }
            format.json { render :show, status: :created, location: @message } #change :new to :show once show view has been created!
          else
            format.html { render :new }
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def read
    end
    
    def show 
    end
    
    def destroy
    @message.destroy
        respond_to do |format|
          format.html { redirect_to outbox_path, notice: 'Message was successfully destroyed.' }
          format.json { head :no_content }
        end
    end
    
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:receiver, :subject, :content)
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end
    
end
