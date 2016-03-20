json.array!(@m_users) do |m_user|
  json.extract! m_user, :id, :id_m_user, :m_user_name, :m_user_surname, :blood_type, :email, :password_digest
  json.url m_user_url(m_user, format: :json)
end
