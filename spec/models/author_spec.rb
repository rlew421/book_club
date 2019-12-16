require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :author_books}
    it {should have_many(:books).through(:author_books)}
  end

  describe 'instance methods' do
    it "#average_page_count" do
      haruki_murakami = Author.create!(name: "Haruki Murakami")

      norwegian_wood = haruki_murakami.books.create!(title: "Norwegian Wood",
                                        publication_year: 1987,
                                        pages: 296)

      kafka = haruki_murakami.books.create!(title: "Kafka On The Shore",
                                        publication_year: 2002,
                                        pages: 505)

      expect(haruki_murakami.average_page_count).to eq(400.5)
    end
  end
end
