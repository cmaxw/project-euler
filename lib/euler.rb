class Euler
 
  class << self
    def abundant_numbers(max)
      numbers = []
      (2..max).each do |num|
        f = factors(num)
        f.delete(num)
        numbers << num if num < f.inject(0) {|m, i| m + i}
      end
      numbers
    end
    
    def factorial(num)
      return 1 if num == 1
      puts num
      num * factorial(num - 1)
    end
    
    def sum_digits(num)
      num_str = num.to_s
      (0..num_str.length).to_a.inject(0) {|memo, i| memo + num_str[i, 1].to_i}
    end
    
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
    
    # Returns an array of all of the factors of a number.
    def factors(number)
      fs = [1,number]
      (2..Math.sqrt(number).to_i).each do |i|
        if number % i == 0
          fs << i
          fs << number/i unless number/i == i
        end
      end
      fs.sort
    end
    
    # Helper for factors. Finds the products of all combinations of n numbers in the array.
    def combination(ary, n)
      return ary if n == 1
      r = []
      (0...ary.length).each do |i|
        r.concat(combination(ary[(i+1)...ary.length], n-1).collect {|a| a * ary[i]})
      end
      return r
    end
    
    # Returns an array containing the prime factors of a number.
    def prime_factors(number)
      fs = []
      f1 = factor(number)
      return [number] if f1 == 1
      f2 = number/f1
      fs.concat(prime_factors(f1))
      fs.concat(prime_factors(f2))
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
    
    # Find the largest vertical sum in a grid.
    def vertical_max(grid, rows, cols, length)
      max = 0
      # For each column
      (0...cols).each do |x|
        # Each entry in the column
        ((length-1)...rows).each do |y|
          # Multiply that entry and the length-1 entries before it and compare
          p = ((y-length+1)..y).inject(1) {|product, i| product * grid[i][x]}
          max = p if max < p
        end
      end
      max
    end
    
    # Find the largest horizontal sum in a grid.
    def horizontal_max(grid, rows, cols, length)
      max = 0
      # For each column
      (0...rows).each do |y|
        # Each entry in the column
        ((length-1)...cols).each do |x|
          # Multiply that entry and the length-1 entries before it and compare
          p = ((x-length+1)..x).inject(1) {|product, i| product * grid[y][i]}
          max = p if max < p
        end
      end
      max
    end
    
    # Find the largest diagonal sum in a grid.
    def diagonal_max(grid, rows, cols, length)
      max = 0
      # For each column
      ((length-1)...rows).each do |y|
        # Each entry in the column
        ((length-1)...cols).each do |x|
          # Multiply that entry and the length-1 entries before it and compare
          p = (0...length).inject(1) {|product, i| product * grid[y-i][x-i]}
          max = p if max < p
        end
      end
      (0...(rows-length)).each do |y|
        # Each entry in the column
        ((length-1)...cols).each do |x|
          # Multiply that entry and the length-1 entries before it and compare
          p = (0...length).inject(1) {|product, i| product * grid[y+i][x-i]}
          max = p if max < p
        end
      end
      max
    end
    
    # Finds the sequence where the next number in the sequence is 3n+1 for odd numbers and n/2 for evens.
    def p14_sequence(number)
      return [1] if number == 1
      [number].concat(number % 2 == 0 ? p14_sequence(number/2) : p14_sequence((3*number) + 1))
    end
  end
end