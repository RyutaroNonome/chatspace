# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.find_or_create_by(id: 1) do |user|
#   user.email = 'test@test.com'
#   user.password = 'mosamosapoodle'
# end

User.delete_all
User.create(id: 1, email: 'hoge@hoge.com', password: 'password', password_confirmation: 'password', name: 'nonome')
User.create(id: 1, email: 'test@test.com', password: 'password', password_confirmation: 'password', name: 'sakamoto')
# User.create(id: 2, name: 'sakamoto')
# User.create(id: 3, name: 'hirapa')
# User.create(id: 4, name: 'watabe')
# User.create(id: 5, name: 'maimai')

Group.delete_all
# Group.create(id: 1, name: 'Unity', user_ids: [1, 2, 3, 5])
# Group.create(id: 2, name: 'Rails', user_ids: [1, 4, 5])