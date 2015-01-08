require 'spec_helper'

describe Library do
  before :all do
    @book_list = [
      Book.new("JavaScript: The Good Parts", "Douglas Crockford", :development),
      Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
      Book.new("Don't Make me Think", "Steve Krug", :usability),
      Book.new("JavaScript Patterns", "Stoyan Stefanov", :development),
      Book.new("Responsive Web Design", "Ethan Marcotte", :design)
    ]
  end

  describe "Setting up a Library" do
    context "when no books are given" do
      Given(:library) {Library.new }
      Then {expect(library.size).to eql 0}
    end 

    context "when list of books are given" do
      Given(:library) {Library.new @book_list}
      Then {expect(library.size).to eql @book_list.size}
    end 
  end

  describe "adding books" do
    context "to an empty library" do
      Given(:library) { Library.new}
      When { library.add_book(Book.new "The Amazing Ruby", "Amazing Author", "C")}
      Then {expect(library.size).to eql 1}
    end
    context "to a library with many books" do
      Given(:library) { Library.new @book_list}
      When { library.add_book(Book.new "T", "A", "C")}
      Then {expect(library.size).to eql @book_list.size + 1}
    end 
  end

  describe "retrieving books by title" do
    context "when no book matching the title" do
      Given(:library) { Library.new @book_list}
      Then {expect(library.get_books_by_title("The Amazing Ruby").size).to eql 0 }
    end 
    context "when only one book matching the title" do
      Given(:library) { Library.new @book_list}
      Then {expect(library.get_books_by_title("Don't Make me Think").size).to eql 1 }
      Then {expect(library.get_books_by_title("Don't Make me Think")[0].author).to eql "Steve Krug" }
    end
  end

  describe "retrieving books by author" do
    context "when no book matching the author" do
      Given(:library) { Library.new @book_list}
      Then {expect(library.get_books_by_author("Vijay Anant").size).to eql 0 }
    end 
    context "when only one book matching the author" do
      Given(:library) { Library.new @book_list}
      Then {expect(library.get_books_by_author("Steve Krug").size).to eql 1 }
    end
  end
end
