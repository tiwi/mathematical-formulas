require './strategies/base'
require 'dentaku'

module Strategies
  class DentakuStrategy < Base
    def initialize
      @calculator = Dentaku::Calculator.new
    end

    def evaluate(formula, variables)
      @calculator.evaluate!(formula, variables)
    end
  end
end