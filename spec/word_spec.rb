require 'rspec'
require 'pry'
require 'word'

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it('checks if it has the same attributes as other words') do
      word1 = Word.new('hello', 1)
      word2 = Word.new('hello', 1)
      expect(word1).to(eq(word2))
    end
  end

  describe('#save') do
    it('saves a word') do
      word1 = Word.new('caio', nil)
      word1.save()
      expect(Word.all).to(eq([word1]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("caio", nil)
      word.save()
      word2 = Word.new("bonjour", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("caio", nil)
      word.save()
      word2 = Word.new("bonjour", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("caio", nil)
      word.save()
      word2 = Word.new("bonjour", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq((word)))
    end
  end
end