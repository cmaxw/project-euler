require 'benchmark'
require 'date'

Benchmark.bm do |x|
  x.report do
    jan = "1 Jan 1901"
    feb = "1 Feb 1901"
    mar = "1 Mar 1901"
    apr = "1 Apr 1901"
    may = "1 May 1901"
    jun = "1 Jun 1901"
    jul = "1 Jul 1901"
    aug = "1 Aug 1901"
    sep = "1 Sept 1901"
    oct = "1 Oct 1901"
    nov = "1 Nov 1901"
    dec = "1 Dec 1901"
    count = 0
    100.times do 
      count += 1 if Date.parse(jan).cwday == 7
      count += 1 if Date.parse(feb).cwday == 7
      count += 1 if Date.parse(mar).cwday == 7
      count += 1 if Date.parse(apr).cwday == 7
      count += 1 if Date.parse(may).cwday == 7
      count += 1 if Date.parse(jun).cwday == 7
      count += 1 if Date.parse(jul).cwday == 7
      count += 1 if Date.parse(aug).cwday == 7
      count += 1 if Date.parse(sep).cwday == 7
      count += 1 if Date.parse(oct).cwday == 7
      count += 1 if Date.parse(nov).cwday == 7
      count += 1 if Date.parse(dec).cwday == 7
      jan = jan.next
      feb = feb.next
      mar = mar.next
      apr = apr.next
      may = may.next
      jun = jun.next
      jul = jul.next
      aug = aug.next
      sep = sep.next
      oct = oct.next
      nov = nov.next
      dec = dec.next
    end
    puts count
  end
end