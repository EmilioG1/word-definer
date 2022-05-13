require 'rspec'
require 'pry'
require 'definition'

describe ('#Definition') do

  
  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Definition.all).to(eq([]))
    end
  end
end