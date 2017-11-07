module UsersHelper

 # Осуществляет вход данного пользователя.
  def log_in(user)
    session[:user_id] = user.id
  end
  
 # Возвращает граватар для данного пользователя
   def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
    # Осуществляет выход текущего пользователя.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end