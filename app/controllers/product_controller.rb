class SlowFoodApp
  get '/' do
    @menus = Menu.all
    erb :welcome
  end

  post '/order_create' do
      product = Product.find(params['product_id'])
      if session[:order_id]
        order = Order.find(session[:order_id])
      else
        order = Order.create
        session[:order_id] = order.id
      end
      order_item = OrderItem.create(product: product, order: order)
      redirect '/', notice: "#{order_item.product.name} was added to your order"
    end

end
