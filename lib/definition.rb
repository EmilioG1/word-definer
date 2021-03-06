
class Definition
  attr_reader :id
  attr_accessor :val, :word_id

  @@definitions = {}
  @@id_count = 0

  def initialize(val, word_id, id)
    @val = val
    @word_id = word_id
    @id = id || @@id_count += 1
  end

  def word
    Word.find(self.word_id)
  end

  def self.all
    @@definitions.values()
  end
  
  def ==(definitions_to_compare)
    self.val() == definitions_to_compare.val() && self.id() == definitions_to_compare.id()
  end

  def save
    @@definitions[self.id] = Definition.new(self.val, self.word_id, self.id)
  end

  def self.clear
    @@definitions = {}
    @@id_count = 0
  end

  def self.find(id)
    @@definitions[id]
  end

  def delete
    @@definitions.delete(self.id)
  end

  def update(val, word_id)
    self.val = val
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.val, self.word_id, self.id)
  end

  def self.find_by_word(w_id)
    array = []
    @@definitions.values.each do |x|
      if x.word_id == w_id
        array.push(x)
      end
    end
    array
  end

  def words
    Word.find(self.word_id)
  end
end