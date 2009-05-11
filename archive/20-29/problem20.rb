require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    puts Euler.sum_digits(Euler.factorial(100))
  end
end