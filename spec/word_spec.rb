require 'rspec'
require 'pry'
require 'word'

describe '#Word' do
  # before(:each) do
  #   Word.clear()
  # end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it('checks if it has the same attributes as other words') do
      word1 = Word.new('hello')
      word2 = Word.new('hello')
      expect(word1).to(eq(word2))
    end
  end
end