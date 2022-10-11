namespace :batch do
  desc "update chat message's counts"
  task count_messages: :environment do
    Chat.all.each do |value|
      @messages_count = Message.where(chat_id:value['id']).count()
      updateChat = Chat.where(id:value['id'])
      updateChat.update(messages_count:@messages_count)
    end

  end

  desc "update app chat's counts"
  task count_chats: :environment do
    App.all.each do |value|
      @chats_count = Chat.where(app_id:value['id']).count()
      updateApp = App.where(id:value['id'])
      updateApp.update(chats_count:@chats_count)
    end    
  end

end
