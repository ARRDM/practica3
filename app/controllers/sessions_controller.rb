class SessionsController < ApplicationController

  def new
  end

  def create
    m_user = MUser.find_by(email: params[:session][:email].downcase)
    if m_user && m_user.authenticate(params[:session][:password])
      log_in m_user
      redirect_to m_user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
