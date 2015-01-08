require 'spec_helper'

describe Book do
  describe "Creating a book" do
    context "All parameters are given" do
      Given(:book) {Book.new "Great bool", "Great Author", "SciFi"}
      Then { expect(book).to be_a Book}
    end
  end
  
end
