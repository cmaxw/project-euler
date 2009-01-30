require 'benchmark'

Benchmark.bm do |x|
  x.report do
    k = 0
    (100..999).to_a.reverse.each do |i|
      (100..999).to_a.reverse.each do |j|
        k = i*j if (i*j > k) && (i*j).to_s.reverse == (i*j).to_s
      end
    end
    puts k
  end
end
