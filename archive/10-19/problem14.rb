require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    
    class Seq
      @depth = {}

      def Seq.p14_sequence_depth(number)
        return 1 if number == 1
        return @depth[number] if @depth[number]
        if number % 2 == 0
          d = p14_sequence_depth(number/2) + 1
          @depth[number] = d
        else
          d = p14_sequence_depth((3*number) + 1) + 1
          @depth[number] = d
        end
        d
      end
    end

    max = 1
    idx = 1
    (2..1000000).each do |i|
      l = Seq.p14_sequence_depth(i)
      if l > max
        max = l
        idx = i
      end
    end
    puts idx
  end
end