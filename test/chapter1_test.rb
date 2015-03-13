require 'test_helper'
require 'minitest/autorun'

describe Chapter1 do
  include Chapter1

  it "#euclid" do
    euclid(60,24).must_equal 12
  end

  it "#min" do
    min(60, 24).must_equal 12
  end

end
