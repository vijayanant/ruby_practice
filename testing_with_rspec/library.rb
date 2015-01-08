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

  def get_books_by_title title
    @books.select { |book| book.title == title}
  end

end 
