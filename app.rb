require 'sinatra/base'
require 'tilt/erb'
require 'yaml'

class ShutUpClaire < Sinatra::Base
  helpers do
    def site(host)
      site = host.split('.claire.').first
      @@sites ||= YAML.load(open('etc/claires.yaml'))
      @@sites[site] || @@sites['shutup']
    end
  end

  get '/css/colours.css' do
    content_type :css
    erb :colours, layout: nil, locals: {
      start: rand(360),
    }
  end

  get '*', provides: 'text/html' do
    details = site(env['HTTP_HOST'])
    erb details['type'].to_sym, locals: details
  end
end
