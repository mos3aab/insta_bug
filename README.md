# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
* Ruby version  - V5

# System dependencies 
* ruby gems rails 
* Yarn package manager 
* mysql

# Configuration: update  
* update config/database.yml
* bundle install / update
* rails db:create
* rails db:migrate
* rails s

* Database creation
# rails db:create

* Database initialization
# rails db:migrate 

* How to use API
# ================ APPS ================
* GET  => /apps    // load all apps
* POST => /apps    // add new app form-data[name]
* PUT  => /apps    // add new app form-data[id,name]
# ================ Chats ================
* GET  =>  /applications/:application_token/chats  // load app chats 
* POST  => /application/chat  //start new chat form-data[id:token]
# ================ Messages ================
* GET  =>  /applications/chat/:id  // load chat messages params[id]
* POST  => /application/chat/msg  // post a msg form-data[id:,body:,user:]

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
# docker-compose build

* ...
