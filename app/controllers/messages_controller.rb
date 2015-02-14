class MessagesController < ApplicationController
    before_action :logged_in_user
    before_action :set_message, only: [:show, :edit, :update, :destroy, :read]
    
    def index
        @messages = Message.where(:receiver => current_user.id).reorder("id DESC").paginate(page: params[:page], :per_page => 5)
        @user = User.all
    end
    
    def outbox
        @messages = current_user.messages.reorder("id DESC").paginate(page: params[:page], :per_page => 5)
        @user = User.all
    end
    
    def new 
        @message = Message.new
    end
    
    def create
        @message = current_user.messages.build(message_params)
        respond_to do |format|
          if @message.save
            flash[:success] = 'Message was successfully sent.'
            format.html { redirect_to @message } 
            format.json { render :show, status: :created, location: @message }
          else
            format.html { render :new }
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def read
        @user = User.all
        message = Message.find(params[:id])
        if message.read == false
            message.update_attribute(:read,    true)
        end
    end
    
    def show 
        @user = User.all
    end
    
    def destroy
    @message.destroy
        respond_to do |format|
          flash[:success] = 'Message was successfully deleted.'
          format.html { redirect_to inbox_path } 
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
