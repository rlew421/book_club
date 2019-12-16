require 'rails_helper'

RSpec.describe 'books index page' do
  describe "as a user" do
    it "I see each book in the system including the book's
    - title
    - number of pages
    - publication year
    - the name of each author that wrote the book" do

      douglas_adams = Author.create!(name: "Douglas Adams")
      hhg = douglas_adams.books.create!(title: "The Hitchhiker's Guide to the Galaxy",
                                        publication_year: 1979,
                                        pages: 224)

      haruki_murakami = Author.create!(name: "Haruki Murakami")
      stephen_king = Author.create!(name: "Stephen King")
      peter_straub = Author.create!(name: "Peter Straub")

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

      visit '/books'
      
      within "#book-#{hhg.id}" do
        expect(page).to have_content(hhg.title)
        expect(page).to have_content("Publication Year: #{hhg.publication_year}")
        expect(page).to have_content("Page Count: #{hhg.pages}")
        expect(page).to have_content("Written by:\n#{douglas_adams.name}")
      end

      within "#book-#{norwegian_wood.id}" do
        expect(page).to have_content(norwegian_wood.title)
        expect(page).to have_content("Publication Year: #{norwegian_wood.publication_year}")
        expect(page).to have_content("Page Count: #{norwegian_wood.pages}")
        expect(page).to have_content("Written by:\n#{haruki_murakami.name}")
      end

      within "#book-#{kafka.id}" do
        expect(page).to have_content(kafka.title)
        expect(page).to have_content("Publication Year: #{kafka.publication_year}")
        expect(page).to have_content("Page Count: #{kafka.pages}")
        expect(page).to have_content("Written by:\n#{haruki_murakami.name}")
      end

      within "#book-#{shining.id}" do
        expect(page).to have_content(shining.title)
        expect(page).to have_content("Publication Year: #{shining.publication_year}")
        expect(page).to have_content("Page Count: #{shining.pages}")
        expect(page).to have_content("Written by:\n#{stephen_king.name}")
      end

      within "#book-#{talisman.id}" do
        expect(page).to have_content(talisman.title)
        expect(page).to have_content("Publication Year: #{talisman.publication_year}")
        expect(page).to have_content("Page Count: #{talisman.pages}")
        expect(page).to have_content("Written by:\n#{stephen_king.name}\n#{peter_straub.name}")
      end
    end
  end
end
