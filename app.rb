require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_words)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post('/word') do
  val = params[:word]
  word = Word.new(val, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:val])
  @word = Word.all
  erb(:words)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:val])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Board.all
  erb(:words)
end