require 'minitest/autorun'
require_relative 'ntn_a3'

class NtnA3Test < Minitest::Test

  EPS = 0.0000001

  def test_should_calculate_nominal_value
      uss_a = 20.3
      uss_b = 32.5

      result = NtnA3.calculate_nominal_value(uss_a, uss_b)

      assert_equal 624.615384, result
  end

  def test_should_calculate_another_nominal_value
      uss_a = 24.12345678
      uss_b = 24.12945678

      result = NtnA3.calculate_nominal_value(uss_a, uss_b)

      assert_equal 999.751341, result
  end

  def test_should_not_round_nominal_value_to_six_decimal_places
    uss_a = 24.12345678
    uss_b = 24.12945678

    result = NtnA3.calculate_nominal_value(uss_a, uss_b)

    assert_in_delta 999.751341, result, EPS
  end

  def test_should_calculate_interest
    factor = 234.555556
    updated_nominal_value = 12.3456789

    result = NtnA3.calculate_interest(updated_nominal_value, factor)

    assert_equal 2895.747578, result
  end

  def test_should_calculate_another_interest
    factor = 2.345
    updated_nominal_value = 4.123

    result = NtnA3.calculate_interest(updated_nominal_value, factor)

    assert_equal 9.668435, result
  end

  def test_should_round_interest_to_six_decimal_places
    factor = 2.3456
    updated_nominal_value = 4.123

    result = NtnA3.calculate_interest(updated_nominal_value, factor)

    assert_in_delta 9.670908, result, EPS
  end

  def test_should_calculate_interest_factor
    i = 0.234456991112
    n = 36

    result = NtnA3.calculate_interest_factor(i, n)

    assert_equal 0.00703370, result
  end

  def test_should_calculate_another_interest_factor
    i = 2.345
    n = 23

    result = NtnA3.calculate_interest_factor(i, n)

    assert_equal 0.04494583, result
  end

end
