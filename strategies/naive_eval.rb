require './strategies/base'

module Strategies
  class NaiveEvalStrategy < Base
    def evaluate(formula, variables)
      expression = formula.downcase
      variables.each do |key, value|
        expression.gsub!(key.downcase, value)
      end
      eval(expression)
    end
  end
end