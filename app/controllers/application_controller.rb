require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    #link to login and signup page in view
    erb :index
  end

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])

    if params[:username] != nil && params[:username] != "" && params[:email] != nil && params[:email] != "" && user.save 
      redirect "/tweets"
    else
      redirect "/signup"
    end
  end

  get '/login' do

  end
  
  post '/login' do

  end

  get '/logout' do

  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end
