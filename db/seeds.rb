# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = "db/de.csv"

cities = []

CSV.foreach(filepath, csv_options) do |row|
  cities << row['city']
end

User.destroy_all
Project.destroy_all

puts 'creating faker user'

faker = User.create!(email: 'faker@greenfunder.de', password: '123456', first_name: 'Faker', last_name: 'User', address: 'Nürnberg')


puts 'creating users'

begana = User.create!(email: 'begana@greenfunder.de', password: '123456', first_name: 'Begana', last_name: 'C.', address: 'Berlin Street')

loretta = User.create!(email: 'loretta@greenfunder.de', password: '123456', first_name: 'Loretta', last_name: 'M.', address: 'Berlin Street')

jonas = User.create!(email: 'jonas@greenfunder.de', password: '123456', first_name: 'Jonas', last_name: 'K.', address: 'Berlin Street')

daniel = User.create!(email: 'daniel@greenfunder.de', password: '123456', first_name: 'Daniel', last_name: 'Skupien', address: 'Berlin Street')


puts 'creating projects'

project1 = Project.new(
    name: "We will grow a forest",
    punchline: 'Help planting a forest near our neighbourhood',
    video: 'https://www.youtube.com/watch?v=HPJKxAhLw5I',
    category: 'planting',
    investment_goal_cents: 34534,
    current_investment_sum_cents: 23952,
    address: 'Stuttgart',
    user_id: begana.id,
)
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/2/29/E.V.A._Lanxmeer_VegetalHedge_2009.jpg')
project1.image.attach(io: file, filename: 'seed1.jpg', content_type: 'image/jpg')
project1.save

project2 = Project.new(
    name: 'Solar panels for Munich',
    punchline: "Let's bring a solar panel on every roof in Munich",
    video: 'https://www.youtube.com/watch?v=LRPy8UZv9V0',
    category: 'energy',
    investment_goal_cents: 134560,
    current_investment_sum_cents: 70343,
    address: 'Munich',
    user_id: loretta.id,
)
file = URI.open('https://knowledge.wharton.upenn.edu/wp-content/uploads/2016/08/solar-city.jpg')
project2.image.attach(io: file, filename: 'seed2.jpg', content_type: 'image/jpg')
project2.save

project3 = Project.new(
    name: 'Bees for our allot settlement',
    punchline: 'Help us grow bees to save the nearby plants',
    category: 'animals',
    investment_goal_cents: 900,
    current_investment_sum_cents: 547,
    address: 'Hamburg',
    user_id: jonas.id,
)
file = URI.open('https://d3qqlmv4he5rj8.cloudfront.net/blog/wp-content/uploads/2016/02/Why-Bees-are-Good-for-Your-Garden.jpg')
project3.image.attach(io: file, filename: 'seed3.jpg', content_type: 'image/jpg')
project3.save

project4 = Project.new(
    name: 'Plastic free vegetable packaging',
    punchline: 'We want to revolutionise packaging',
    description: "We have a clear goal: Find a different and more sustainable solution for plastic. In a view years we should all be able to say goodbye to plastic in packaging. All of our package waste should be compostable. With your help we want to make that possible. We have reason to believe that a fungus called mycelium can be an alternative to plastic. Incidentally, they are found in almost every square centimeter of the earth's soil and provide a very flexible material. Researchers have already been able to use them to make bricks or lampshades, for example. They only need water and a constant supply of carbon for their growth. For their growth, the fungi only need water and a constant supply of carbon. Production initially yields a kind of moist glue, which becomes a stable and resilient material after drying. Although mycelium is particularly well suited as a packaging alternative for plastic, it can also be used to produce very good sustainable leather. There is even a fungus that can eat petroleum-based plastic. It is called Pestalotiopsis microspora and grows in the rainforest of Ecuador. Help us to boost our research and bring this to life. We will prove this will work. With this initial step we will be able to get this up and running and will be a huge step further to make the planet free of plastic waste.",
    video: 'https://www.youtube.com/watch?v=6eiKSW3Tq_o',
    category: 'plastic alternatives',
    investment_goal_cents: 30240,
    current_investment_sum_cents: 27532,
    address: 'Potsdam',
    user_id: jonas.id,
)
file = URI.open('https://grendz.com/wp-content/uploads/2019/07/1564377080gn8k4.jpg')
project4.image.attach(io: file, filename: 'seed4.jpg', content_type: 'image/jpg')
project4.save

project5 = Project.new(
    name: 'Rooftop garden for community property',
    punchline: 'Invest in our rooftop garden and help make the Cologne greener',
    video: 'https://www.youtube.com/watch?v=blUZPbNOprA',
    category: 'planting',
    investment_goal_cents: 8750,
    current_investment_sum_cents: 3456,
    address: 'Cologne',
    user_id: jonas.id,
)
file = URI.open('https://live.staticflickr.com/2391/5710660746_0f2bac30fe_b.jpg')
project5.image.attach(io: file, filename: 'seed4.jpg', content_type: 'image/jpg')
project5.save


# FULLY BOOSTED

boosted1 = Project.new(
    name: 'Bees on our rooftop',
    punchline: "Let's give the flowers of our city some usefull bees",
    category: 'planting',
    investment_goal_cents: 670,
    current_investment_sum_cents: 682,
    address: cities.sample,
    user_id: jonas.id,
)
file = URI.open('https://live.staticflickr.com/1914/45037101982_d99b093451_b.jpg')
boosted1.image.attach(io: file, filename: 'bees1.jpg', content_type: 'image/jpg')
boosted1.save

boosted2 = Project.new(
    name: 'Nice garden for kindergarden',
    punchline: "Help us bring some flowers and plants to our children's kinder garden",
    category: 'planting',
    investment_goal_cents: 2470,
    current_investment_sum_cents: 2503,
    address: cities.sample,
    user_id: jonas.id,
)
file = URI.open('https://www.preschools.sa.gov.au/sites/default/files/image_12_dscn9211.jpg')
boosted2.image.attach(io: file, filename: 'garden2.jpg', content_type: 'image/jpg')
boosted2.save

# FAKERS

# puts 'installing 70 faker projects'

# categories = ['planting', 'animals', 'energy', 'plastic alternatives']

# 70.times do
#   faker_project = Project.new(
#     name: "FAKE 200er Project",
#     punchline: 'We will make the world much less platic poluted',
#     video: 'https://www.youtube.com/watch?v=8ArSSjsxHBM',
#     category: categories.sample,
#     investment_goal_cents: Faker::Number.between(from: 17000, to: 20000),
#     current_investment_sum_cents: Faker::Number.between(from: 2000, to: 16999),
#     address: cities.sample,
#     user_id: faker.id,
#   )
#   file = URI.open('https://source.unsplash.com/random/320x250')
#   faker_project.image.attach(io: file, filename: "faker_plastic_alternatives#{counter.to_s}.jpg", content_type: 'image/jpg')
#   faker_project.save
#   counter += 1
# end

puts 'seed finished'


