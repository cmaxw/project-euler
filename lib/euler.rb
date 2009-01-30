class Euler
 
  # Returns an array containing the prime factors of a number.
  def Euler.factors(number)
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
end