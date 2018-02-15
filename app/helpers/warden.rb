Rack::Builder.new do
  use Rack::Session::Cookie, :secret => "cowabungadudes!!!"

  use Warden::Manager do |manager|
    manager.default_strategies :password, :basic
    manager.failure_app = BadAuthenticationEndsUpHere
  end

  run SomeApp
end
