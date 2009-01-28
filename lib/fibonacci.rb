class Fibonacci
  attr_accessor :value
  attr_accessor :previous
  
  def initialize
    @value = 1
    @previous = 0
  end
  
  def next
    old_value = @value
    @value += @previous
    @previous = old_value
  end
end