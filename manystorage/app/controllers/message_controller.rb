class MessagesController < ApplicationController
   
    def index
       
     @messages = Message.all
    end
    
    def new
     @message = Message.new
    end
    
    
      def show
        @message = Message.find(params[:id])
      end
      def create
        @message = Message.new(message_params)
        if @message.save
          redirect_to @message, notice: 'Message was successfully created.'
        else
          render :new
        end
      end
  
    private
  
    def message_params
      params.require(:message).permit(:title, :content, images: []) # Note the `images: []` for an array of images
    end
  end
  