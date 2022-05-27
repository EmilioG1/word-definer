require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  before(:each) do
    Word.clear
    Definition.clear
    @word = Word.new("house", nil)
    @word.save
  end

  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'house')
    click_on('Go!')
    expect(page).to have_content('house')
  end
  
  it('updates a word') do
    visit("/words/#{@word.id}")
    click_on('Edit word')
    fill_in('val', :with => 'coffee')
    click_on('Update')
    expect(page).to have_content('coffee')
  end
  
  it('deletes a word') do
    visit("/words/#{@word.id}/edit")
    click_on('Delete word')
    expect(page).to have_content('')
  end
end

describe('create a definition path', {:type => :feature}) do
  
  before(:each) do
    Word.clear
    Definition.clear
    @word = Word.new("house", nil)
    @word.save
    @definition = Definition.new("a humble abode", @word.id, nil)
    @definition.save
    end

  it('creates a definition') do
    visit("/words/#{@word.id}")
    fill_in('defs_name', :with => 'a humble abode')
    click_on('Add definition')
    expect(page).to have_content('a humble abode')
  end

  it('updates a definition') do
    visit("/words/#{@word.id}/definitions/#{@definition.id}")
    fill_in('val', :with => 'a place for stuff')
    click_on('Update definition')
    expect(page).to have_content('a place for stuff')
  end

  it('deletes a definition') do
    visit("/words/#{@word.id}/definitions/#{@definition.id}")
    click_on('Delete definition')
    expect(page).to have_content('')
  end
end
