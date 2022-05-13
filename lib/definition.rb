require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

class Definition
  @@defs = {}
  @@id_count = 0

  def initialize(value, id)
    @value = value
    @id = id || @id_count += 1
  end

  def
end