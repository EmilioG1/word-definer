require 'rspec'
require 'pry'
require 'definition'

describe ('#Definition') do
  before(:each) do
    Definition.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#==') do
    it('checks if it has the same attributes as other definitions') do
      defs = Definition.new('hello', 1)
      defs2 = Definition.new('hello', 1)
      expect(defs).to(eq(defs2))
    end
  end

  describe('#save') do
    it('saves a definition') do
      defs = Definition.new('caio', nil)
      defs.save()
      expect(Definition.all).to(eq([defs]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      defs = Definition.new("caio", nil)
      defs.save()
      defs2 = Definition.new("bonjour", nil)
      defs2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      defs = Definition.new("caio", nil)
      defs.save()
      defs2 = Definition.new("bonjour", nil)
      defs2.save()
      expect(Definition.find(defs.id)).to(eq((defs)))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      defs = Definition.new("caio", nil)
      defs.save()
      defs2 = Definition.new("bonjour", nil)
      defs2.save()
      defs.delete()
      expect(Definition.all).to(eq([defs2]))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      defs = Definition.new("caio", nil)
      defs.save()
      defs.update("bonjour")
      expect(defs.val).to(eq("bonjour"))
    end
  end
end