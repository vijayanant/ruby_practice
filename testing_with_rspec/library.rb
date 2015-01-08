class Library
  def initialize book_list=[]
    @books = book_list.dup
  end 

  def add_book book
    @books << book
  end
  def size 
    @books.size
  end
end 
