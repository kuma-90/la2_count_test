require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end


get '/' do
  @number = Count.first.number
  erb :index
end



post '/plus' do
 count = Count.first
count.number =count.number + 1
count.save
redirect'/'
end

post '/minus' do
  count =Count.first
  count.number =count.number - 1
  count.save
  redirect'/'
end

post '/clear' do
  count=Count.first
  count.number= count.number - count.number
  count.save
  redirect'/'
end

post '/kakeru' do
  count=Count.first
  count.number=count.number + count.number
  count.save
  redirect'/'
end

post '/waru' do
  count=Count.first
  count.number=count.number - count.number/2
  count.save
  redirect'/'
end


get '//plus' do
  @number = Count.first.number
  erb :index
end