ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'
require 'uri'
require 'pathname'
require 'pg'
require 'active_record'
require 'logger'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require 'sinatra/reloader' if development?
require 'pry' unless production?
require 'warden'

require 'erb'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = 'slow_food'

require APP_ROOT.join('config', 'database')


class SlowFoodApp < Sinatra::Base
  disable :logger, :dump_errors
  enable :sessions
  register Sinatra::Flash
  helpers Sinatra::RedirectWithFlash
  set :session_secret, ENV['SESSION_SECRET'] || '1234ewqweert452233'
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'public')
  set :show_exceptions, false
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

Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
