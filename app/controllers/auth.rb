require 'sinatra'
require 'warden'

class SlowFoodApp #< Sinatra::Application

  post  '/process_login' do
     # 1 Try to login the user using Warden (gem)
     #check_authentication
     # 2 If user is logged in, redirect back to '/'
      redirect '/'
     # # 3 If user fails login redirect back to '/login'
     # redirect '/login'
  end

  get "/protected_pages" do
    check_authentication
    erb 'admin_only_page'.to_sym
  end

  get "/login" do
    erb '/login'.to_sym
  end

  get "/register" do
    erb '/register'.to_sym
  end

  post "/auth/create" do
    #binding.pry
    user = User.new(params)
    if user.valid?
      #binding.pry
      user.save
      env['warden'].authenticate!
      flash[:success] = "Successfully created account for #{current_user.email}"
        redirect '/'
    else
      #binding.pry
      flash[:error] = user.errors.full_messages.join(',')
      redirect '/auth/create'
    end
  end

  post '/session' do
    warden_handler.authenticate!
    if warden_handler.authenticated?
      redirect "/users/#{warden_handler.user.id}"
    else
      redirect "/"
    end
  end

  get "/logout" do
    warden_handler.logout
    redirect '/login'
  end

  post "/unauthenticated" do
    redirect "/fuckoff"
  end

end
