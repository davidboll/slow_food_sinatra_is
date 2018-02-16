require 'sinatra'
require 'warden'

class SlowFoodApp #< Sinatra::Application

  post '/process_login' do
    if env['warden'].authenticate!
      redirect '/', notice: "Logged in #{current_user.email}"
    else
      redirect '/login', notice: 'This did not worked!'
    end
    # 1 Try to login the user using Warden (gem)
    #check_authentication
    # 2 If user is logged in, redirect back to '/'
    redirect '/'
    # # 3 If user fails login redirect back to '/login'
    # redirect '/login'
  end

  get '/protected_pages' do
    check_authentication
    erb 'admin_only_page'.to_sym
  end

  get '/login' do
    erb '/login'.to_sym
  end

  get '/register' do
    erb '/register'.to_sym
  end

  post '/auth/create' do
    if params[:password] == params[:password_confirmation]
      user = User.create(params)
      if user.persisted?
        env['warden'].authenticate!
        message = "Successfully created account for #{user.email}"
        redirect '/', notice: message
      else
        message = user.errors.full_messages.join(',')
        redirect '/auth/create', notice: message
      end
    else
      message = 'The fuck is wrong with you?'
      redirect '/auth/create', notice: message
    end

  end

  post '/session' do
    warden_handler.authenticate!
    if warden_handler.authenticated?
      redirect "/users/#{warden_handler.user.id}"
    else
      redirect '/'
    end
  end

  get '/logout' do
    warden_handler.logout
    redirect '/login'
  end

  post '/unauthenticated' do
    redirect '/fuckoff'
  end

end
