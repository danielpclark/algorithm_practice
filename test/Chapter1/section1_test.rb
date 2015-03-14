require 'test_helper'
require 'minitest/autorun'

describe Chapter1 do
  include Chapter1::Section1

  it "#euclid" do
    euclid(60,24).must_equal 12
    euclid(24,12).must_equal 12
    euclid(12,0).must_equal 12
  end

  it "#min" do
    min(60, 24).must_equal 12
  end

  it "#sieve_of_Eratosthenes" do
    sieve_of_Eratosthenes(100).must_equal [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
  end

end
