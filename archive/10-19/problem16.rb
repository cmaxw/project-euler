require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
		puts Euler.sum_digits(2**1000)
	end
end