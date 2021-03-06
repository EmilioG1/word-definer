
class Word
  attr_reader :val, :id
  @@words = {}
  @@id_count = 0
  
  def initialize(val, id)
    @val = val
    @id = id || @@id_count += 1
  end

  def self.all
    @@words.values()
  end

  def ==(word_to_compare)
    self.val() == word_to_compare.val() && self.id() == word_to_compare.id()
  end

  def save
    @@words[self.id] = Word.new(self.val, self.id)
  end

  def self.clear
    @@words = {}
    @@id_count = 0
  end

  def self.find(id)
    @@words[id]
  end

  def delete
    @@words.delete(self.id)
  end

  def update(val)
    @val = val
  end

  def fin
    Definition.find_by_word(self.id)
  end

end