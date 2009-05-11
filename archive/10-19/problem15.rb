require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    @results = {}
    
    def path_count(height, width)
      return 1 if height == 0 || width == 0
      return @results["#{height}-#{width}"] if @results["#{height}-#{width}"]
      @results["#{height}-#{width}"] = @results["#{width}-#{height}"] = path_count(height-1, width) + path_count(height, width-1)
    end

    puts path_count(20, 20)
	end
end
