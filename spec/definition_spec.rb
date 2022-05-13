require 'rspec'
require 'pry'
require 'definition'

describe ('#Definition') do
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('hello', nil)
    @word.save()
  end

  describe('.all') do
    it('returns an array of all definitions') do
      defs = Definition.new('words', @word.id, 1)
      defs.save()
      defs2 = Definition.new('things', @word.id, 2)
      defs2.save()
      expect(Definition.all).to(eq([defs, defs2]))
    end
  end

  describe('#==') do
    it('checks if it has the same attributes as other definitions') do
      defs = Definition.new('hello', @word.id, 1)
      defs2 = Definition.new('hello', @word.id, 1)
      expect(defs).to(eq(defs2))
    end
  end

  describe('#save') do
    it('saves a definition') do
      defs = Definition.new('caio', @word.id, nil)
      defs.save()
      expect(Definition.all).to(eq([defs]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      defs = Definition.new("caio", @word.id, nil)
      defs.save()
      defs2 = Definition.new("bonjour", @word.id, nil)
      defs2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      defs = Definition.new("caio", @word.id, nil)
      defs.save()
      defs2 = Definition.new("bonjour", @word.id, nil)
      defs2.save()
      expect(Definition.find(defs.id)).to(eq((defs)))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      defs = Definition.new("caio", @word.id, nil)
      defs.save()
      defs2 = Definition.new("bonjour", @word.id, nil)
      defs2.save()
      defs.delete()
      expect(Definition.all).to(eq([defs2]))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      defs = Definition.new("caio", @word.id, nil)
      defs.save()
      defs.update("bonjour")
      expect(defs.val).to(eq("bonjour"))
    end
  end
end