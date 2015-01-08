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

  describe "adding books to" do
    context "empty library" do
      Given(:library) { Library.new}
      When { library.add_book(Book.new "T", "A", "C")}
      Then {expect(library.size).to eql 1}
    end
    context "library with many books" do
      Given(:library) { Library.new @book_list}
      When { library.add_book(Book.new "T", "A", "C")}
      Then {expect(library.size).to eql @book_list.size + 1}
    end 
  end
end
