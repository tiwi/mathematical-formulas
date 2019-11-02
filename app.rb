require 'sinatra/base'
require 'haml'
require './evaluator'

class App < Sinatra::Base
  get '/' do
    evaluator = Evaluator.new
    haml :index, locals: { evaluator: evaluator }
  end

  post '/evaluate' do
    evaluator = Evaluator.new(params)
    result = evaluator.evaluate
    haml :index, locals: { evaluator: evaluator, result: result }
  end
end