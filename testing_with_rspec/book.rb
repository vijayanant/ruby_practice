class Book
  attr_accessor :title
  attr_accessor :author
  attr_accessor :category

  def initialize title, author, category
    @title = title
    @author = author
    @category = category
  end
end 

