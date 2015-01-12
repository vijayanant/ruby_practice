require_relative '../fzerch'
require 'rspec/given'

describe FuzzySearch do
  before :all do
    @lines = [
      "This is a sample ipput line",
      "this is another input line with Z"
    ]
      
    @input = @lines.join("\n")
    puts @input
  end

  describe "Set-up" do
    context "when text and search string are given" do
      Given(:search) {FuzzySearch.new @lines, "thp" }
      Then { expect(search).to be_a FuzzySearch}
    end
  end

  describe "search" do 
    context "when no chars to match" do
      Given(:fuzzy) { FuzzySearch.new @lines}
      Then { expect(fuzzy.search()).to eql @lines}
    end
    context "when single char match" do
      Given(:fuzzy) { FuzzySearch.new @lines}
      Then { expect(fuzzy.search('Z').length).to eql 1}
      Then { expect(fuzzy.search('Z')).to eql @lines[1..1]}
    end
  end
end
