require 'sinatra/base'

class ShutUpClaire < Sinatra::Base
  get '/css/colours.css' do
    content_type :css
    erb :colours, locals: {
      start: rand(360),
    }
  end

  get '*', provides: 'text/html' do
    send_file 'public/index.html'
  end
end
