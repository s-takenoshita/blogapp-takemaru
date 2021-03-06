# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create dummy data
taro = User.find_by(email: 'taro@example.com')
hanako = User.find_by(email: 'hanako@example.com')

# taro = User.create!(email: 'taro@example.com', password: '99999999')
# hanako = User.create!(email: 'hanako@example.com', password: '99999999')

5.times do
    taro.articles.create(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 100)
    )
end

5.times do
    hanako.articles.create(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 100)
    )
end
