class FuzzySearch 
  def initialize text, chars= ''
    @lines = text
    @result = search chars # Does it causes problem with inheritance scenarios ?
    # update @query only after search, otherwise we always return from first line with nil
    @query = chars
  end 

  def search query=''
    #return saved search result if query hasn't changed
    return @result if query == @query

    @query = query 
    @result = @lines.map do |line|
      [line, score(line, query)]
    end.select do |line, score|
      score > 0.0
    end.sort_by do |line, score|
      -score
    end.map do |line, score|
      line
    end
  end 

  # Computes score of choice string against query characters.
  # Score is higher if longer substrings are found.
  def score choice, query
    return 1.0 if query.length == 0
    return 0.0 if choice.length == 0
    query = query.downcase
    choice = choice.downcase
    match_length = find_matches(choice, query.each_char.to_a)
    return 0.0 unless match_length

    score = query.length.to_f / match_length.to_f

    score / choice.length
  end 

  def find_matches (string, query)
    first_char,  *rest = query
    first_indeces = find_char(string, first_char)

    first_indeces.map do |index|
      last_index = find_end_of_match(string, rest, index)
      last_index ? last_index - index + 1 : nil
    end.compact.min
  end

  def find_char(string, char)
    index = 0
    indeces = []
    while index 
      index = string.index(char, index)
      if index
        indeces << index
        index+=1
      end
    end
      indeces
  end

  def find_end_of_match(string, chars, first)
    last_index = first

    chars.each do |this_char|
      index = string.index(this_char, last_index + 1)
      return nil unless index
      last_index = index
    end
    last_index
  end
end 

