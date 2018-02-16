Warden::Strategies.add(:password) do
  def authenticate!
    user = User.find_by(email: params['email'])
    # 1. there is no user with that email
    # 2. the password is not correct
    # 3 all is good and the user should be logged in
    if user.nil?
      throw(:warden, message: 'We could not find you in our records.')
    elsif user.authenticate(params['password'])
      session[:user_id] = user.id
      success!(user)
    else
      throw(:warden, message: 'The email and password did not match, try again...')
    end

  end
end
