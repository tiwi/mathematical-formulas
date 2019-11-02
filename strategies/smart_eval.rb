require './strategies/base'

module Strategies
  class SmartEvalStrategy < Base
    VALID_EXPRESSION = /\A[0-9\.\+\-\*\/\(\)]*\z/

    def evaluate(formula, variables)
      expression = formula.downcase
      variables.each do |key, value|
        expression.gsub!(key.downcase, value)
      end
      validate(expression)
      eval(expression)
    end

    private

    def validate(expression)
      raise 'Invalid formula' unless VALID_EXPRESSION =~ expression
    end
  end
end