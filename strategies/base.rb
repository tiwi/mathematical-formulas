module Strategies
  class Base
    def evaluate(formula, variables)
      raise NotImplementedError
    end
  end
end