require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    return erb(:index)
  end

  get '/cv' do 
    return erb(:cv)
  end

  get '/cover-letter' do
    return erb(:cover_letter)
  end
end
