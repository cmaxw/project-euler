require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    def permutation(elements, number)
      return elements.join if number == 0
      return elements.first if elements.length == 1
      first_index = number / Euler.factorial(elements.length - 1)
      first_element = elements[first_index]
      elements.delete_at(first_index)
      "#{first_element}#{permutation(elements, number % Euler.factorial(elements.length))}"
    end
    elements = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    # elements = ["0", "1", "2"]
    puts permutation(elements.collect {|i| i}, 999999)
    # puts permutation(elements.collect {|i| i}, 1)
    # puts permutation(elements.collect {|i| i}, 2)
    # puts permutation(elements.collect {|i| i}, 3)
    # puts permutation(elements.collect {|i| i}, 4)
    # puts permutation(elements.collect {|i| i}, 5)
  end
end