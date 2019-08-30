require 'sinatra'
require 'json'

posts = [{title: 'aaaa', body: 'bbb'}]

get '/' do
  'Hello world!'
end

get '/posts' do
  posts.inject('') { |result, p| result += "#{p[:title]}: #{p[:body]}<br>" }
end

post '/posts' do
  data = JSON.parse request.body.read
  puts data
  posts.append(title: data["title"], body: data["body"])
  "#{data["title"]}: #{data["body"]}"
end

get '/posts/:id' do
  'Not found' if params[:id].positive? || params[:id] >= posts.length
  "#{p[:title]}: #{p[:body]}<br>"
end