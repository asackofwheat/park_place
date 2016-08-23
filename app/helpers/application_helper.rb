module ApplicationHelper

  def navbar
    if signed_in_user?
      render partial: "shared/navbar-login", locals: {current_user: current_user}
    else
      render "shared/navbar"
    end
  end

end
