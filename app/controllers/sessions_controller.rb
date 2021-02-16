class SessionsController < ApplicationController
    get '/login' do
        erb :"/users/login.html"
    end

    # this method does not login user it confirms that the user entered in the correct information for login
    post '/login' do
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/'
        else
            erb :'users/login.html'
        end
    end

end
