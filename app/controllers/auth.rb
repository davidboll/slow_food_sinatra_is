class SlowFoodApp

  get '/' do
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  get '/signup' do

  end

  get  '/loggedin' do
    erb :welcome
  end

end
