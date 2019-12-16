# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Authors
douglas_adams = Author.create!(name: "Douglas Adams")
haruki_murakami = Author.create!(name: "Haruki Murakami")
stephen_king = Author.create!(name: "Stephen King")
peter_straub = Author.create!(name: "Peter Straub")

# Books
hhg = douglas_adams.books.create!(title: "The Hitchhiker's Guide to the Galaxy",
  publication_year: 1979,
  pages: 224)

norwegian_wood = haruki_murakami.books.create!(title: "Norwegian Wood",
                                  publication_year: 1987,
                                  pages: 296)

kafka = haruki_murakami.books.create!(title: "Kafka On The Shore",
                                  publication_year: 2002,
                                  pages: 505)

shining = stephen_king.books.create!(title: "The Shining",
                                  publication_year: 1980,
                                  pages: 447)

talisman = Book.create!(title: "The Talisman",
                                  publication_year: 1984,
                                  pages: 921)

stephen_king.books << talisman
peter_straub.books << talisman
