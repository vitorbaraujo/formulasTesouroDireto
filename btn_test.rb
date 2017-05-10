require 'minitest/autorun'
require_relative 'btn'

EPS = 0.0000001

class BtnTest < Minitest::Test
  def test_should_calculate_unit_price
    pu_ant = 1000.000000
    tr = 0.230000
    result = Btn.calculate_unit_price(pu_ant, tr)
    assert_in_delta 230.000000, result, EPS
  end

  def test_should_calculate_another_unit_price
    pu_ant = 500.000000
    tr = 0.230000
    result = Btn.calculate_unit_price(pu_ant, tr)
    assert_in_delta 115.000000, result, EPS
  end

  def test_should_calculate_right_even_with_less_decimals
    pu_ant = 500.00
    tr = 0.230
    result = Btn.calculate_unit_price(pu_ant, tr)
    assert_in_delta 115.000000, result, EPS
  end

  def test_should_calculate_right_even_with_more_decimals
    pu_ant = 500.0000000000000000000
    tr = 0.23000000000000000000
    result = Btn.calculate_unit_price(pu_ant, tr)
    assert_in_delta 115.000000, result, EPS
  end

  def test_should_truncate_previous_price_before_calculate_unit_price
    pu_ant = 0.0000019
    tr = 1000000

    result = Btn.calculate_unit_price(pu_ant, tr)

    assert_equal (result - 1.9).abs <= EPS, false
    assert_in_delta 1.0, result, EPS
  end

  def test_should_calculate_interest
    pu_at = 115.000000
    fj = 1.78954260
    result = Btn.calculate_interest(pu_at, fj)

    assert_equal 205.797399, result 
  end

end
