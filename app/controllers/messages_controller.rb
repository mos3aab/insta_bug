class MessagesController < ApplicationController
    
    def index
        if !Message.exists?(chat_id:params['id'])
            render json:"No Messages Found !"
        else
        @chat = Message.where(chat_id:params['id'])
        render json:@chat
        end
    end

    def create
        if !Chat.exists?(id:params['id'])
            render json:"Chat Not Found !"
        else
            @chat = Message.where(chat_id:params['id']).last()
            newmsg = Message.new
            newmsg.body = params['body']
            newmsg.chat_id =params['id']
            if  number = 1 
            else
                number = @chat['number']+1
            end
            newmsg.number = @chat.nil? ? 1:@chat['number']+1
            # 0 app , 1 user 
            newmsg.flag =params['user'] == nil ?  0: 1
            newmsg.save

            # update chat msg_count
            updateChat = Chat.where(id:params['id']).last()
            count = updateChat['messages_count']+1
            updateChat.update(messages_count:count)
            updateChat.save

            render json:newmsg
        end
    end
end
