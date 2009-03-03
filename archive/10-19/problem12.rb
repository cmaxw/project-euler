require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    factors = []
    i = 1
    number = 1
    while factors.length < 500
      i += 1
      number += i
      factors = Euler.factors(number)
    end
    puts number
  end
end