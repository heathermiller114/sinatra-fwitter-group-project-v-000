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
        if logged_in?
            @tweet = Tweet.find_by(id: params[:id])
            erb :'tweets/show_tweet'
        else
            redirect '/login'
        end
    end

    get '/tweets/:id/edit' do
        #load form to edit
        @tweet = Tweet.find_by(id: params[:id])
        if logged_in? && @tweet && @tweet.user_id = current_user.id
                erb :'tweets/edit_tweet'
        else
            redirect '/login'
        end
    end

    patch '/tweets/:id' do
        @tweet = Tweet.find_by(id: params[:id])
        #binding.pry

        if params[:content].empty?
            redirect "/tweets/#{@tweet.id}/edit"
        else
            @tweet.update(content: params[:content])

            redirect "/tweets/#{@tweet.id}"
        end

    end

    delete '/tweets/:id/delete' do
        tweet = Tweet.find_by(id: params[:id])      
        if logged_in? && tweet.user_id == current_user.id
            tweet.delete
            redirect '/tweets'
        else
            redirect '/login'
        end
    end

end
