require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    puts Euler.pythagorean_triple_from_sum(1000).inject(1) {|product, i| product * i}
  end
end