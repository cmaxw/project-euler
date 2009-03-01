require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    puts Euler.primes_less_than(2000000).inject {|sum, i| sum + i}
  end
end