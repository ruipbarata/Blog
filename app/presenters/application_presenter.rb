class ApplicationPresenter

  def current_user_title(current_user)
    current_user.username.present? ? current_user.username : current_user.email
  end

end