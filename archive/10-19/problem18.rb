require 'benchmark'

triangle = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

Benchmark.bm do |x|
  x.report do
    def sum(triangle)
      t_ary = triangle.split("\n").reverse
      t_ary.each_with_index do |line, i|
        if i > 0
          last = @last_line
          @last_line = []
          l = line.split(" ")
          l.each_with_index do |n, ni|
            @last_line[ni] = n.to_i + (last[ni] > last[ni+1] ? last[ni] : last[ni+1])
          end
        else
          @last_line = line.split(" ").map {|n| n.to_i}
        end
      end
      @last_line[0]
    end
    
    puts sum(triangle)
  end
end