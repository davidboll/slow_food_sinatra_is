class SlowFoodApp

  get '/' do
    @menus = Menu.all
    erb :welcome
  end
end
