
puts "Cleaning the DB..."
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all
puts "DB cleaned"






List.create!(
    name: "Top Movies",
    description: "My top movies",
    img_url: "https://img.freepik.com/free-vector/cinema-open-neon-sign_1262-15882.jpg?w=2000"
  )


List.create!(
  name: "Old Movies",
  description: "My top movies",
  img_url: "https://img.freepik.com/free-vector/cinema-open-neon-sign_1262-15882.jpg?w=2000"
)



puts "------------------------"
puts "List created"
puts "------------------------"






require 'json'
require 'net/http'

# Fetch top-rated movie data from the Le Wagon API
url = URI('https://tmdb.lewagon.com/movie/top_rated')
response = Net::HTTP.get(url)
movies_data = JSON.parse(response)['results']

# Seed the movies
movies_data.each do |movie_data|
  Movie.create(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    ratings: movie_data['vote_average']
  )
end




puts "------------------------"
puts "Movies created"
puts "------------------------"



# Find the "Old movies V3" list
old_movies_list = List.find_by(name: "Old Movies")

# Find the movies you want to add
movie1 = Movie.find_by(title: "12 Angry Men")
movie2 = Movie.find_by(title: "GoodFellas")
movie3 = Movie.find_by(title: "The Good, the Bad and the Ugly")


# Create bookmarks for the movies in the list
Bookmark.create!(
  movie: movie1,
  list: old_movies_list,
  comment: "This is a great movie!"
)

Bookmark.create!(
  movie: movie2,
  list: old_movies_list,
  comment: "Woooooaw"
)


Bookmark.create!(
  movie: movie3,
  list: old_movies_list,
  comment: "Amazing!"
)


puts "------------------------"
puts "Bookmarks created"
puts "------------------------"
