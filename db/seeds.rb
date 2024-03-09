require "open-uri"

puts 'creating new seeds'

Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

fileSummer = URI.open("https://upload.wikimedia.org/wikipedia/commons/5/52/Metro_Kino_Wien_innen.jpg")
fileFall = URI.open("https://upload.wikimedia.org/wikipedia/commons/1/1c/Battle_Ground_Cinema%2C_July_2020.jpg")
fileWinter = URI.open("https://upload.wikimedia.org/wikipedia/commons/3/30/Cinemaaustralia.jpg")
fileSpring = URI.open("https://upload.wikimedia.org/wikipedia/commons/4/48/Debbie_Reynolds_Auction_-_Bell_%26_Howell_2709_camera.jpg")


summer = List.new(name: 'summer list')
summer.photo.attach(io: fileSummer, filename: "summer", content_type: "image/png")
summer.save

fall = List.new(name: 'fall list')
fall.photo.attach(io: fileFall, filename: "fall", content_type: "image/png")
fall.save

winter = List.new(name: 'winter list')
winter.photo.attach(io: fileWinter, filename: "winter", content_type: "image/png")
winter.save

spring = List.new(name: 'spring list')
spring.photo.attach(io: fileSpring, filename: "spring", content_type: "image/png")
spring.save


Bookmark.create!(comment: 'Best Movie ever', movie_id: 1, list_id: 1)
Bookmark.create!(comment: 'blah, wasted my time', movie_id: 2, list_id: 2)
Bookmark.create!(comment: 'Not bad not bad', movie_id: 3, list_id: 4)
Bookmark.create!(comment: 'I enjoyed more the book', movie_id: 1, list_id: 1)
Bookmark.create!(comment: 'Amazing!!!!', movie_id: 4, list_id: 3)
