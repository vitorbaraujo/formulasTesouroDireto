require 'minitest/autorun'
require_relative 'ntn_a1'

class NtnA1Test < Minitest::Test

  def test_should_calculate_amortization_unit_price
    uss_a = 3.546
    uss_b = 2.998
    emission_value = 17
    amort_perc = 2

    result = NtnA1.calculate_amortization_unit_price(uss_a, uss_b, emission_value, amort_perc)

    assert_equal 40.214810, result
  end

  def test_should_calculate_another_amortization_unit_price
    uss_a = 2.3
    uss_b = 2.4
    emission_value = 17
    amort_perc = 2

    result = NtnA1.calculate_amortization_unit_price(uss_a, uss_b, emission_value, amort_perc)

    assert_equal 32.583333, result
  end

  def test_should_calculate_liquid_value
    emission_value = 23
    amort_perc = 3.456

    result = NtnA1.calculate_liquid_value(emission_value, amort_perc)

    assert_equal 79.488, result
  end

  def test_should_calculate_another_liquid_value
    emission_value = 2.789
    amort_perc = 9.456

    result = NtnA1.calculate_liquid_value(emission_value, amort_perc)

    assert_equal 26.372784, result
  end

  def test_should_calculate_interest_truncating_with_six_decimal_places
    amort_unit_price = 20
    factor_list = [1.2345678]

    result = NtnA1.calculate_interest(amort_unit_price, factor_list)

    assert_equal 24.691356, result
  end

  def test_should_calculate_another_interest
    amort_unit_price = 30
    factor_list = [1, 2, 3, 4.5]

    result = NtnA1.calculate_interest(amort_unit_price, factor_list)

    assert_equal 315.000000, result
  end

  def test_should_calculate_sum_of_interest_rates
    factor_list = [ {dtp: 23, dtup: 20, i: 0.41}, {dtp: 29, dtup: 16, i: 0.32}, {dtp: 14, dtup: 7, i: 0.78}]

    result = NtnA1.calculate_interests_sum(factor_list)

    assert_equal 0.0003013888888888889, result
  end

end
