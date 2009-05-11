require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    abundants = Euler.abundant_numbers(28123)
    sums = []
    len = abundants.length
    abundants.each_with_index do |o, i|
      # puts o
      (i...len).each do |index|
        sums << (o + abundants[index])
        break if (o+abundants[index]) > 28123
      end
    end
    sum = 0
    sums.uniq!
    (1..28123).each do |i|
      sum += i if !sums.include?(i)
    end
    puts sum
  end
end