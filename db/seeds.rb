# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Project.destroy_all

puts 'creating users'

begana = User.create!(email: 'begana@greenfunder.de', password: '123456', first_name: 'Begana', last_name: 'C.', address: 'Berlin Street')

loretta = User.create!(email: 'loretta@greenfunder.de', password: '123456', first_name: 'Loretta', last_name: 'M.', address: 'Berlin Street')

jonas = User.create!(email: 'jonas@greenfunder.de', password: '123456', first_name: 'Jonas', last_name: 'K.', address: 'Berlin Street')

daniel = User.create!(email: 'daniel@greenfunder.de', password: '123456', first_name: 'Daniel', last_name: 'Skupien', address: 'Berlin Street')

puts 'creating projects'

project1 = Project.new(
    name: 'Project 1',
    punchline: 'amazing punchline',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Justo donec enim diam vulputate ut pharetra sit amet. Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Etiam erat velit scelerisque in dictum non. A condimentum vitae sapien pellentesque habitant morbi tristique. Ac tincidunt vitae semper quis. Convallis posuere morbi leo urna molestie. Mattis rhoncus urna neque viverra justo nec ultrices. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Tincidunt nunc pulvinar sapien et ligula ullamcorper. Mauris ultrices eros in cursus turpis massa. Quisque egestas diam in arcu cursus euismod. Pretium quam vulputate dignissim suspendisse in est ante in. Consequat ac felis donec et odio pellentesque diam volutpat commodo. Imperdiet dui accumsan sit amet nulla facilisi morbi tempus. In nulla posuere sollicitudin aliquam ultrices sagittis. Id venenatis a condimentum vitae sapien pellentesque habitant. Euismod nisi porta lorem mollis aliquam ut porttitor. Tellus rutrum tellus pellentesque eu.',
    video: 'https://www.youtube.com/watch?v=XDdpfWgS4kM',
    category: 'gardening',
    investment_goal: 10000,
    current_investment_sum: 0,
    address: 'Berlin',
    user_id: begana.id,
)
file = URI.open('https://res.cloudinary.com/rentmylife/image/upload/v1614783406/assets/eastern-white-pine-trees-4125586-04-3b9e60ad3ac14efba38ce0ec72b6770d_qjvux8.jpg')
project1.image.attach(io: file, filename: 'seed1.jpg', content_type: 'image/jpg')
project1.save

project2 = Project.new(
    name: 'Project 2',
    punchline: 'amazing punchline',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Justo donec enim diam vulputate ut pharetra sit amet. Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Etiam erat velit scelerisque in dictum non. A condimentum vitae sapien pellentesque habitant morbi tristique. Ac tincidunt vitae semper quis. Convallis posuere morbi leo urna molestie. Mattis rhoncus urna neque viverra justo nec ultrices. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Tincidunt nunc pulvinar sapien et ligula ullamcorper. Mauris ultrices eros in cursus turpis massa. Quisque egestas diam in arcu cursus euismod. Pretium quam vulputate dignissim suspendisse in est ante in. Consequat ac felis donec et odio pellentesque diam volutpat commodo. Imperdiet dui accumsan sit amet nulla facilisi morbi tempus. In nulla posuere sollicitudin aliquam ultrices sagittis. Id venenatis a condimentum vitae sapien pellentesque habitant. Euismod nisi porta lorem mollis aliquam ut porttitor. Tellus rutrum tellus pellentesque eu.',
    video: 'https://www.youtube.com/watch?v=XDdpfWgS4kM',
    category: 'gardening',
    investment_goal: 10000,
    current_investment_sum: 0,
    address: 'Munich',
    user_id: loretta.id,
)
file = URI.open('https://res.cloudinary.com/rentmylife/image/upload/v1614783937/assets/bee-146810332_sszmax.jpg')
project2.image.attach(io: file, filename: 'seed2.jpg', content_type: 'image/jpg')
project2.save

project3 = Project.new(
    name: 'Project 3',
    punchline: 'amazing punchline',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Justo donec enim diam vulputate ut pharetra sit amet. Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Etiam erat velit scelerisque in dictum non. A condimentum vitae sapien pellentesque habitant morbi tristique. Ac tincidunt vitae semper quis. Convallis posuere morbi leo urna molestie. Mattis rhoncus urna neque viverra justo nec ultrices. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Tincidunt nunc pulvinar sapien et ligula ullamcorper. Mauris ultrices eros in cursus turpis massa. Quisque egestas diam in arcu cursus euismod. Pretium quam vulputate dignissim suspendisse in est ante in. Consequat ac felis donec et odio pellentesque diam volutpat commodo. Imperdiet dui accumsan sit amet nulla facilisi morbi tempus. In nulla posuere sollicitudin aliquam ultrices sagittis. Id venenatis a condimentum vitae sapien pellentesque habitant. Euismod nisi porta lorem mollis aliquam ut porttitor. Tellus rutrum tellus pellentesque eu.',
    video: 'https://www.youtube.com/watch?v=XDdpfWgS4kM',
    category: 'gardening',
    investment_goal: 10000,
    current_investment_sum: 0,
    address: 'Dresden',
    user_id: jonas.id,
)
file = URI.open('https://res.cloudinary.com/rentmylife/image/upload/v1614783993/assets/water_nlvy2t.jpg')
project3.image.attach(io: file, filename: 'seed3.jpg', content_type: 'image/jpg')
project3.save

project4 = Project.new(
    name: 'Project 4',
    punchline: 'amazing punchline',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Justo donec enim diam vulputate ut pharetra sit amet. Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Etiam erat velit scelerisque in dictum non. A condimentum vitae sapien pellentesque habitant morbi tristique. Ac tincidunt vitae semper quis. Convallis posuere morbi leo urna molestie. Mattis rhoncus urna neque viverra justo nec ultrices. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Tincidunt nunc pulvinar sapien et ligula ullamcorper. Mauris ultrices eros in cursus turpis massa. Quisque egestas diam in arcu cursus euismod. Pretium quam vulputate dignissim suspendisse in est ante in. Consequat ac felis donec et odio pellentesque diam volutpat commodo. Imperdiet dui accumsan sit amet nulla facilisi morbi tempus. In nulla posuere sollicitudin aliquam ultrices sagittis. Id venenatis a condimentum vitae sapien pellentesque habitant. Euismod nisi porta lorem mollis aliquam ut porttitor. Tellus rutrum tellus pellentesque eu.',
    video: 'https://www.youtube.com/watch?v=XDdpfWgS4kM',
    category: 'gardening',
    investment_goal: 10000,
    current_investment_sum: 0,
    address: 'Hamburg',
    user_id: daniel.id,
)
file = URI.open('https://res.cloudinary.com/rentmylife/image/upload/v1614784027/assets/jade-planting-growing_ejx8kn.jpg')
project4.image.attach(io: file, filename: 'seed4.jpg', content_type: 'image/jpg')
project4.save

puts 'seed finished'

