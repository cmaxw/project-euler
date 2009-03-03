require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    puts Euler.sum_of_squares(100) - Euler.square_of_sum(100)
  end
end