

def prime_factor(number)
  f1 = factor(number)
  return number if f1 == 1
  f2 = number/f1
  p1 = prime_factor(f1)
  p2 = prime_factor(f2)
  return p1 if p1 > p2
  return p2
end

def factor(number)
  val = Math.sqrt(number).floor
  while number%val != 0
    val -= 1
  end
  return val
end