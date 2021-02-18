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
        @log.title = params[:title]
        @log.description = params[:description]
        @log.link = params[:link]
        @log.date = params[:date]
        @log.user = current_user

        if @log.save
            redirect '/logs'
        else    
            erb :"logs/new.html"
        end
    end

    get '/logs/:id/edit' do # I need to edit a specific log 
        # I want to render a form to edit a log 
        @log = current_user.logs.find(params[:id]) # need to locate log before I can edit it.
        erb :"logs/edit.html"
    end

end


# the order of routes in a controller matters! 
    # most specific routes go first!
# mount to config.ru
# 