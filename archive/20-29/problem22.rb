require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    
    A_VAL = "A"[0] - 1
    
    def alpha_score(str)
      score = 0
      str.upcase.each_byte do |letter|
        score += (letter - A_VAL)
      end
      score
    end
    
    f = File.open("names.txt", "r")
    names = f.readline.gsub(/"/, "").gsub(/\s/, "").split(",").sort
    total = 0
    names.each_with_index do |name, i|
      total += (alpha_score(name) * (i + 1))
    end
    puts total
  end
end