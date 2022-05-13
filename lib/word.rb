require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

class Word
  attr_accessor :val
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
end