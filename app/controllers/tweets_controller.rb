class TweetsController < ApplicationController

    get '/tweets' do
        if logged_in?
            @tweets = Tweet.all
            erb :'tweets/tweets'
        else
            redirect '/login'
        end
    end
    
    get '/tweets/new' do
        #load create tweet form
        if logged_in?
            erb :'tweets/new'
        else
            redirect '/login'
        end
    end

    post '/tweets' do
        #process new form submission
        #binding.pry
        if params[:content].empty?
            redirect "/tweets/new"
        else
            @tweet = Tweet.create(params)
            @tweet.user_id = current_user.id
            @tweet.save

            redirect "/tweets/#{@tweet.id}"
        end
    
    end

    get '/tweets/:id' do
        #display info for single tweet
    end

    get '/tweets/:id/edit' do
        #load form to edit
    end

    patch '/tweets/:id' do

    end

    delete '/tweets/:id' do
        
    end

end
