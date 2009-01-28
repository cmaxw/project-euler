require 'lib/fibonacci'

fib = Fibonacci.new

sum = 0
while fib.value < 4000000
  sum += fib.value if fib.value%2 == 0
  fib.next
end

puts sum