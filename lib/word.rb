require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

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
    self.val() == word_to_compare.val()
  end

  def save
    @@words[self.id] = Word.new(self.val, self.id)
  end

  def self.clear
    @@words = {}
    @@id_count = 0
  end
end