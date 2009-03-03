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
  
  grid = [
    [1, 2, 3, 4, 5],
    [1, 2, 5, 4, 4],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 5, 5]
  ]
  
  it "should find the largest product for a vertical adjacent set of 3 numbers" do
    Euler.vertical_max(grid, 5, 5, 3).should == 125
  end
  
  it "should find the largest product for a horizontal adjacent set of 3 numbers" do
    Euler.horizontal_max(grid, 5, 5, 3).should == 80
  end
  
  it "should find the largest product for a vertical adjacent set of 3 numbers" do
    Euler.diagonal_max(grid, 5, 5, 3).should == 100
  end
  
  it "should return all of the products of two of the numbers" do
    Euler.combination([1,2,3,4,5], 2).should == [2,3,4,5,6,8,10,12,15,20]
  end
  
  it "should return all of the factors of the number 100" do
    Euler.factors(100).should == [1,2,4,5,10,20,25,50,100]
  end
end