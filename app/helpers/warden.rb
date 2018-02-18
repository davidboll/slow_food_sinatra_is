Warden::Strategies.add(:password) do
  def authenticate!
    user = User.find_by(email: params['email'])
    if user.nil?
      throw(:warden, message: 'Sorry, we were unable to find you in our system.')
    elsif user.authenticate(params['password'])
      session[:user_id] = user.id
      success!(user)
    else
      throw(:warden, message: 'The email and/or password did not match, please try again.')
    end

  end
end
