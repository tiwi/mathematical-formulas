require './strategies/naive_eval'
require './strategies/smart_eval'
require './strategies/dentaku'

class Evaluator
  VARIABLES = %w(width length height)

  VARIABLES.each do |var|
    define_method(var.to_sym) do
      @attributes[var]
    end

    define_method("#{var}=".to_sym) do |value|
      @attributes[var] = value
    end
  end

  attr_reader :attributes, :formula

  def initialize(attrs = {})
    @attributes = {}
    @formula = attrs[:formula]
    attributes = attrs[:variable] || {}
    attributes.each do |key, value|
      public_send("#{key}=", value)
    end
    @strategy = Strategies::DentakuStrategy.new
  end

  def evaluate
    @strategy.evaluate(@formula, @attributes)
  end
end