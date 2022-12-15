# frozen_string_literal: true

# solving class
class Expression
  attr_accessor :arg_x, :arg_y

  def initialize(arg)
    @arg_x = arg
  end

  def calculcate
    Math.log(@arg_x) / Math.cos(@arg_x)**2 + @arg_x**3 - 5
  end
end
puts 'Enter x: '

obj = Expression.new gets.to_f
puts obj.calculcate
