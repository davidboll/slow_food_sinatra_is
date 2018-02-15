require 'sinatra'

class SlowFoodApp

  get '/' do
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  get '/signup' do

  end

  post  '/process_login' do

    # 1 Try to login the user using Warden (gem)
    # 2 If user is logged in, redirect back to '/'
       redirect '/'
    # # 3 If user fails login redirect back to '/login'
    #   redirect '/login'
  end

end
