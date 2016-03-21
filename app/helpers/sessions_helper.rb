module SessionsHelper

  def log_in(m_user)
    session[:id] = m_user.id
  end

  def log_out
    forget(m_user_actual)
    session.delete(:id)
    @m_user = nil
  end

  def forget(m_user)
    cookies.delete(:id)
  end

  def m_user_actual
    if(m_user_id = session[:id])
      @m_user_actual ||= MUser.find_by(id: m_user_id)
      m_user = MUser.find_by(id: m_user_id)
    elsif (m_user_id = cookies.signed[:id])
      m_user = MUser.find_by(id: m_user_id)
      if m_user && m_user.authenticated?(:remember, cookies[:remember_token])
        log_in m_user
        @m_user_actual = m_user
      end
    end
  end

  def conectado?
    !m_user_actual.nil?
  end

end
