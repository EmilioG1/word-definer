require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

class Word

  @@words = {}
  @@id_count = 0
  
  def initialize(val)
    @val = val
  end

  def self.all
    @@words.values()
  end
end