# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
99.times do |n|
  nombre = Faker::Name.name
  apellido = Faker::Name.last_name
  blood = "A+"
  correo = "persona-#{n+1}@ejemplo.com"
  password = "password"
 m = MUser.create!(m_user_name: nombre,
                m_user_surname: apellido,
                blood_type_user: blood,
                email: correo,
                password: password)
  titulo = Faker::Lorem.sentence(3)
  blood2 = "A+"
  location = "Tabasco"
  phone = "5553259#{n}03"
  text = Faker::Lorem.sentence
  m_user = n+1
  m.posts.create!(title: titulo,
                  blood_type_post: blood2,
                  location_post: location,
                  phone_post: phone,
                  description: text)
end
