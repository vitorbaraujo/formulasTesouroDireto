require 'minitest/autorun'
require_relative 'ntn_a'

class NtnATest < Minitest::Test

  def test_should_calculate_amortization_unit_price
    uss_a = 3.546
    uss_b = 2.998
    liquid_value = 34

    result = NtnA.calculate_amortization_unit_price(uss_a, uss_b, liquid_value)

    assert_equal 40.214810, result
  end

  def test_should_calculate_another_amortization_unit_price
    uss_a = 2.3
    uss_b = 2.4
    liquid_value = 34

    result = NtnA.calculate_amortization_unit_price(uss_a, uss_b, liquid_value)

    assert_equal 32.583333, result
  end

  def test_should_calculate_liquid_value
    emission_value = 23
    amort_perc = 3.456

    result = NtnA.calculate_liquid_value(emission_value, amort_perc)

    assert_equal 79.488, result
  end

  def test_should_calculate_another_liquid_value
    emission_value = 2.789
    amort_perc = 9.456

    result = NtnA.calculate_liquid_value(emission_value, amort_perc)

    assert_equal 26.372784, result
  end

end
