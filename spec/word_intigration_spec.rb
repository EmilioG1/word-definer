require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'house')
    click_on('Go!')
    expect(page).to have_content('house')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("house", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('defs_name', :with => 'All You Need Is Love')
    click_on('Add definition')
    expect(page).to have_content('All You Need Is Love')
  end
end
