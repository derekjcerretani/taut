module UsersHelper

  def signup_user(user)
    if user.save
      Contact.create(username: user.username)
      log_in user
      flash[:success] = "Welcome to Taut"
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def get_contacts
    Message.where(contact_id: @user.id).map do |message|
      message.user
    end.uniq
  end

end
