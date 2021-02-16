class Logs < ApplicationController

    before '/logs/*' do
        authentication_required
    end

    get '/logs/new' do
        erb :"logs/new.html"
    end

    get '/logs/1' do
        "Hello"
    end

end