require 'sinatra'
require 'warden'

class SlowFoodApp #< Sinatra::Application

  # #OLD STUFF
  # get '/' do
  #   erb :welcome
  # end
  #
  # get '/login' do
  #   erb :login
  # end
  #
  # get '/signup' do
  #
  # end
  #
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

  # Warden configuration code
  use Rack::Session::Cookie, secret: "IdoNotHaveAnySecret"
  #use Rack::Flash, accessorize: [:error, :success]

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = SlowFoodApp
    manager.serialize_into_session {|user| user.id}
    manager.serialize_from_session {|id| Datastore.for(:user).find_by_id(id)}
  end

  Warden::Manager.before_failure do |env,opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  Warden::Strategies.add(:password) do
    def valid?
      params["email"] || params["password"]
    end

    def authenticate!
      user = Datastore.for(:user).find_by_email(params["email"])
      if user && user.authenticate(params["password"])
        success!(user)
      else
        fail!("Could not log in")
      end
    end
  end

  def warden_handler
    env['warden']
  end

  def check_authentication
    unless warden_handler.authenticated?
      redirect '/login'
    end
  end

  def current_user
    warden_handler.user
  end

end
