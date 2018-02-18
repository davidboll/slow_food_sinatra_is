require 'sinatra'
require 'warden'

class SlowFoodApp

  post '/process_login' do
    # Try to login the user using Warden
    if env['warden'].authenticate!
      redirect '/', notice: "Logged in #{current_user.email}"
    else # If user fails login redirect back to '/login'
      redirect '/login', notice: 'Something went wrong, please try again.'
    end
    # If user is logged in, redirect back to '/'
    redirect '/'
  end

  get '/login' do
    erb '/login'.to_sym
  end

  get '/logout' do
    env['warden'].logout
    redirect '/login'
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
      message = 'Sorry, something went wrong - Please try again!'
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

end
