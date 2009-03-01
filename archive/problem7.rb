require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    puts Euler.prime(10001)
  end
end