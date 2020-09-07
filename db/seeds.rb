# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
json_movies = File.read('result.json')
json_movies_hash = JSON.parse(json_movies)

json_movies_hash.each do |movie|
    puts movie['name']
    puts movie['description']
    puts movie['poster_image']
    puts movie['director']['name']
    puts movie['director']['image']
    puts movie['director']['description']
    #geners
    movie['genres'].each do |gener|
      puts gener
    end
    # images of movies
    movie['images'].each do |image|
        puts image
    end
    # stars of movie 
    movie['stars'].each do |star|
        puts star['name']
        puts star['image']
        puts star['description']
    end
    break
end