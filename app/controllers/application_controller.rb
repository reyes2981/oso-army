require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, "osoarmyapp-1234" # required to start a session

    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end


  # can be used in views 
  helpers do 

    def logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id] 
    end

    def authentication_required
      if !logged_in?
        flash[:notice] = "You must be Logged in."
        redirect '/'
      end
    end
  end

end
