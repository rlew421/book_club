require 'rails_helper'

RSpec.describe 'author show page' do
  describe "From the books index I can click an author's name as a link and be taken to an author show page" do
    it "I can see the author with that id including the author's
    - name
    - title of each book they have written
    - the average number of pages for all their books" do

    haruki_murakami = Author.create!(name: "Haruki Murakami")

    norwegian_wood = haruki_murakami.books.create!(title: "Norwegian Wood",
                                      publication_year: 1987,
                                      pages: 296)

    kafka = haruki_murakami.books.create!(title: "Kafka On The Shore",
                                      publication_year: 2002,
                                      pages: 505)

      visit '/books'

      within "#book-#{norwegian_wood.id}" do
        click_link "#{haruki_murakami.name}"
      end
      
      expect(current_path).to eq("/authors/#{haruki_murakami.id}")
      expect(page).to have_content(haruki_murakami.name)

      within "#book-#{norwegian_wood.id}" do
        expect(page).to have_content(norwegian_wood.title)
      end
      within "#book-#{kafka.id}" do
        expect(page).to have_content(kafka.title)
      end

      expect(page).to have_content("Average Page Count: 400.5")
    end
  end
end
