class ChatsController < ApplicationController

# view all chats url : applications/d246a72292c4010fef8c140345041f2eac59b384/chats
    def index
    app_id = App.where(token: params['application_token']).first()
    @chats = Chat.where(app_id:app_id['id'])
    render json:@chats
    end
    
    # create new chat url /application/chat body { id:""}  
    def create
    if !App.exists?(token: params['id'])
        render json:"App Not Found !"
    else
    # get last chat 
    app_id = App.where(token: params['id']).first()
    last_chat = Chat.where(app_id:app_id['id']).last()
        
        # init new chat
        newChat = Chat.new
        newChat.number =last_chat['number']+1
        newChat.app_id =app_id['id']
        newChat.messages_count =1
        newChat.save
        
        # init new msg 
        newMsg = Message.new
        newMsg.chat_id =newChat['number']
        newMsg.number =1
        # Flag =1 mean sent by app 
        newMsg.flag =1
        newMsg.body = "Hello ..."
        newMsg.save
        
        # return chat number 
        render json:newChat['number']
    end
    end

          
      
end
