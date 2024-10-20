genres = ["Action", "Comedy", "Drama", "Fantasy", "Horror", "Romance", "Sci-Fi", "Thriller"]

genres.each do |genre|
  Genre.create(name: genre)
end