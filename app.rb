require 'sinatra/base'

class ShutUpClaire < Sinatra::Base
  get '/' do
    send_file 'public/index.html'
  end

  get '/css/colours.css' do
    content_type :css
    erb :colours, locals: {
      start: rand(360),
    }
  end
end
