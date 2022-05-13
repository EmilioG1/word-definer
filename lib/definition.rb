require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

class Definition
  attr_reader :value, :id
  @@definitions = {}
  @@id_count = 0

  def initialize(value, id)
    @value = value
    @id = id || @id_count += 1
  end

  def self.all
    @@definitions.values()
  end

end