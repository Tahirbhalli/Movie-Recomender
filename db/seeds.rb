require 'json'
json_movies = File.read('result.json')
json_movies_hash = JSON.parse(json_movies)

json_movies_hash.each do |movie|
    director = nil
    if Director.where(name: movie['director']['name']).exists?
        director = Director.find_by(name: movie['director']['name'])
    else
        director = Director.create(name: movie['director']['name'],image: movie['director']['image'],description: movie['director']['description'])
        director.save
    end
    director.movies.create(name: movie['name'],poster_url:movie['poster_image'],description: movie['description'])
    current_movie = Movie.find_by(name: movie['name'])
    
    movie['genres'].each do |gener|
        geners = nil
        if Genersofmovie.where(name: gener).exists?
            geners = Genersofmovie.find_by(name: gener)
        else
            geners = Genersofmovie.new(name: gener)
            geners.save
        end
        Genersandmovie.create(movie_id: current_movie.id,genersofmovie_id: geners.id)
      #puts gener
    end
    # images of movies
    movie['images'].each do |image|
        current_movie.movie_images.create(image_url: image)
        # puts image
    end
    # stars of movie 
    movie['stars'].each do |star|
    cstar = nil
    if Star.where(name: star['name']).exists?
        cstar = Star.find_by(name: star['name'])
    else
        cstar = Star.new(name: star['name'],pic_url:star['image'],description:star['description'])
        cstar.save
    end
    Starandmovie.create(movie_id: current_movie.id,star_id: cstar.id)
    end
end