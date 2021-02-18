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

    get '/logs/:id' do
        @log = current_user.logs.find(params[:id]) # ensures that you only have access to your log and nobody elses
        
        erb :"logs/show.html"
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


# the order of routes in a controller matters! 
    # most specific routes go first!
# mount to config.ru
# 