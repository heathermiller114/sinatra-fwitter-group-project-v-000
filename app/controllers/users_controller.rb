class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/create_user'
        else
            redirect "/tweets"
    end
end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect "/signup"
        else
            @user = User.new(username: params[:username], email: params[:email], password: params[:password])
            @user.save
            session[:user_id] = @user.id

            redirect "/tweets"
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect "/tweets"
        end
    end
    
    post '/login' do
    #binding.pry
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/tweets"
    else
        redirect "/login"
    end
    end

    get '/logout' do
        if logged_in?
            session.clear
        end
            redirect "/login"
    end

    get '/users/:slug' do
        @user = User.find_by(params[:id])
        @user_tweets = User.tweets
        erb :'users/show'
    end


end
