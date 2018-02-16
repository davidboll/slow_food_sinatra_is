Warden::Strategies.add(:password) do
  def authenticate!
    user = User.find_by(email: params['email'])
    user.authenticate(params['password'])
  end
end
