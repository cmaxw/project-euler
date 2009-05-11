require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    def sum(ary)
      ary.inject(0) {|m, o| m + o}
    end
    
    
    pairs = {}
    (2..10000).each do |i|
      factors = Euler.factors(i)
      factors.delete(i)
      am = sum(factors)
      am_factors = Euler.factors(am)
      am_factors.delete(am)
      if am != i && i == sum(am_factors)
        pairs[i] = am
        pairs[am] = i
      end
    end
    puts sum(pairs.keys)
  end
end