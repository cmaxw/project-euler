require 'lib/euler'

describe Euler do
  it "should calculate the largest product of any 5 consecutive digits" do
    Euler.largest_product_of_digits(123454321, 5).should == (3*4*5*4*3)
  end  
  
  it "should find a pythagorean triple with the number included" do
    Euler.pythagorean_triple(5).should == [[3,4,5], [4,3,5]]
  end
  
  it "should find all primes less than the number specified" do
    Euler.primes_less_than(30).should == [2,3,5,7,11,13,17,19,23,29]
  end
end