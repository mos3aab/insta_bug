class AppsController < ApplicationController

  # view all app for chats
    def index
      @apps = App.all()
      render json:@apps
    end
    
    # create new app
    def create
      if App.exists?(name: params['name'])
        render json:"App Name already exist !"
      else
        newApp = App.new
        newApp.name =params['name']
        newApp.token =self.generate_token
        newApp.save
        render json:newApp
      end
    end
    # view app
    def show
      if App.exists?(token: params['id'])
        app_id = App.where(token: params['id']).first()
        chats = Chat.where(app_id:app_id['id'])
        render json:chats
      else
        render json:"App Not Found !"
      end

    end 
    # update app 
    def update
      if !App.exists?(token: params['id'])
        render json:"App Not Found !"
      else
        updateApp = App.where(token:params['id'])
        updateApp.update(name:params['name'])
        render json:"Updated!"
      end
    end

    def destroy
      render json:"Function Not Available !"
    end

    def generate_token
        loop do
          token = SecureRandom.hex(20)
          break token unless App.where(token: token).exists?
        end
      end

end
