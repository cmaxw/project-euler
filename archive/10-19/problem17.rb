require 'benchmark'
require 'lib/euler'

Benchmark.bm do |x|
  x.report do
    def letter_count(num)
      str = ""
      num_str = num.to_s
      if num_str[-4, 1]
        str << "one thousand"
      end
      case num_str[-3, 1]
      when "1"
        str << "one hundred"
      when "2"
        str << "two hundred"
      when "3"
        str << "three hundred"
      when "4"
        str << "four hundred"
      when "5"
        str << "five hundred"
      when "6"
        str << "six hundred"
      when "7"
        str << "seven hundred"
      when "8"
        str << "eight hundred"
      when "9"
        str << "nine hundred"
      end
      str << " and " if num_str[-3, 1] && num_str[-2, 2] != "00"
      if num_str[-2, 1] == "1"
        case num_str[-1, 1]
        when "0"
          str << "ten"
        when "1"
          str << "eleven"
        when "2"
          str << "twelve"
        when "3"
          str << "thirteen"
        when "4"
          str << "fourteen"
        when "5"
          str << "fifteen"
        when "6"
          str << "sixteen"
        when "7"
          str << "seventeen"
        when "8"
          str << "eighteen"
        when "9"
          str << "nineteen"
        end
      else
        case num_str[-2, 1]
        when "2"
          str << "twenty"
        when "3"
          str << "thirty"
        when "4"
          str << "forty"
        when "5"
          str << "fifty"
        when "6"
          str << "sixty"
        when "7"
          str << "seventy"
        when "8"
          str << "eighty"
        when "9"
          str << "ninety"
        end
        case num_str[-1, 1]
        when "1"
          str << "one"
        when "2"
          str << "two"
        when "3"
          str << "three"
        when "4"
          str << "four"
        when "5"
          str << "five"
        when "6"
          str << "six"
        when "7"
          str << "seven"
        when "8"
          str << "eight"
        when "9"
          str << "nine"
        end
      end
      puts str
      str.gsub(/[^a-zA-Z]/, "").length
    end
    
    puts (1..1000).to_a.inject(0) {|memo, i| memo + letter_count(i)}
    # puts letter_count(1000)
    #     puts letter_count(201)
    #     puts letter_count(5)
  end
end