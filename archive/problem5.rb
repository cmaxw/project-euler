require 'benchmark'

def factors(number)
  fs = []
  f1 = factor(number)
  return [number] if f1 == 1
  f2 = number/f1
  fs.concat(factors(f1))
  fs.concat(factors(f2))
  return fs
end

def factor(number)
  val = Math.sqrt(number).floor
  while number%val != 0
    val -= 1
  end
  return val
end

def excluded(container, included)
  ex = []
  container.each do |f|
    included.delete_at(included.index(f)) if included.include?(f)
  end
  return included
end

Benchmark.bm do |x|
  x.report do
    number = 1
    (1..20).to_a.reverse.each do |i|
      excluded(factors(number), factors(i)).each do |f|
        number = number * f
      end
    end
    puts number
  end
end
  