require 'sinatra/base'

class MandrillStatistics < Sinatra::Base
  get '/' do
    'Hello MandrillStatistics!'
  end

  run! if app_file == $0
end
