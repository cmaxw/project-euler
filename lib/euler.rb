class Euler
 
  class << self
    # Returns the nth prime number.
    def prime(n)
      return 2 if n == 1
      return 3 if n == 2
      primes = [2,3]
      (3..n).each do 
        last = primes.last
        a = last + 2
        prime = false
        while prime == false
          prime = true
          primes.each do |p|
            if a % p == 0
              a = a + 1
              prime = false
              break
            end
          end
        end
        primes << a
      end
      primes.last
    end
    
    # Returns true if n is prime.
    def is_prime?(n, primes = nil)
      top = Math.sqrt(n).to_i
      if primes
        (0..(primes.length - 1)).each do |i|
          return true if primes[i] > top
          return false if n % primes[i] == 0
        end
      else
        (2..top).each do |i|
          return false if n % i == 0
        end
      end
      true
    end
    
    # Returns an array of all prime numbers less than n.
    def primes_less_than(n)
      primes = [2,3]
      (5..n).each do |i|
        if i%2 == 1
          primes << i if is_prime?(i, primes)
        end
      end
      primes
    end
    
    # Returns an array containing the prime factors of a number.
    def factors(number)
      fs = []
      f1 = factor(number)
      return [number] if f1 == 1
      f2 = number/f1
      fs.concat(factors(f1))
      fs.concat(factors(f2))
      return fs
    end

    # Finds the highest factor of number that is less than or equal to the square root of the number.
    def factor(number)
      val = Math.sqrt(number).floor
      while number%val != 0
        val -= 1
      end
      return val
    end

    # Returns an array of elements that are not included in container array but are in included array.
    def excluded(container, included)
      container.each do |f|
        included.delete_at(included.index(f)) if included.include?(f)
      end
      return included
    end
    
    # Returns the sum of the squares of all numbers up to and including n.
    def sum_of_squares(n)
      sum = 0
      (1..n).each {|i| sum = sum + (i*i)}
      sum
    end
    
    # Returns the square of the sum of all numbers up to and including n.
    def square_of_sum(n)
      sum = 0
      (1..n).each {|i| sum = sum + i}
      sum * sum
    end
    
    def largest_product_of_digits(number, size)
      n_str = number.to_s
      answer = 0
      (0..(n_str.length - size + 1)).each do |i|
        product = 1
        n_str[i, size].split(//).each {|x| product = product * x.to_i}
        answer = product if product > answer
      end
      answer
    end
    
    def pythagorean_triple_from_sum(sum)
      start = 1
      (start...sum).each do |i|
        triples = pythagorean_triple(i)
        triples.each do |triple|
          return triple if triple && (triple.inject {|total, n| total + n }.to_i == sum)
        end
      end
      return nil
    end
    
    def pythagorean_triple(hypotenuse)
      square = hypotenuse*hypotenuse
      triples = []
      (1...hypotenuse).to_a.reverse.each do |i|
       diff = square - (i*i)
       triples << [Math.sqrt(diff).to_i, i, hypotenuse] if Math.sqrt(diff) % 1 == 0.0
      end
      triples
    end
  end
end