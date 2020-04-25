class Score
  attr_accessor :score

  def initialize
  @score = {}
  
  end

  def add_to_score(key, value)
    self
    @score["#{key}"] = "#{value}"
    
  end

end
