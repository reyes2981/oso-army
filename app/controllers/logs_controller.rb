class LogsController < ApplicationController

    before '/logs/*' do
        authentication_required
    end

    get '/logs' do
        @logs = current_user.logs
        erb :"logs/index.html"
    end

    get '/logs/new' do
        erb :"logs/new.html"
    end

    post '/logs' do
        @log = Log.new
        @log.content = params[:content]
        @log.user = current_user

        if @log.save
            redirect '/logs'
        else    
            erb :"playlists/new.html"
        end
    end

end

# mount to config.ru