require 'benchmark'
require 'lib/fibonacci'

Benchmark.bm do |x|
  x.report do
    fib = Fibonacci.new
    fs = fib.value.to_s
    index = 1
    while fs.length < 1000 do
      fib.next
      fs = fib.value.to_s
      index += 1
    end
    puts index
  end
end

