require 'rubygems'
require 'sinatra/base'
require 'cocaine'
require './lib/pixel_converter'

class Pixel8 < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/convert' do
    if params[:convert] && tmpfile = params[:convert][:tempfile]
      @rgb_matrix = PixelConverter.new(params[:convert][:tempfile]).to_rgb_matrix
    end

    erb :index

  end



end

