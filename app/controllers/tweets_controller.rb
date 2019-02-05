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
    end

    post '/tweets' do
        #process new form submission
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
