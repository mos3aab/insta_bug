every 1.minute do
    rake 'batch:count_messages'
    rake 'batch:count_chats'
  end