require 'minitest/autorun'
require_relative 'ntn_b'

class NtnBTest < Minitest::Test

  EPS_SIX = 0.0000001
  EPS_EIGHT = 0.000000001

  def test_should_calculate_nominal_value
    factor = 1.2345
    ipca_t = 23.4323424
    ipca_t0 = 45.232393
    vn = 123.9998

    result = NtnB.calculate_nominal_value(factor, ipca_t, ipca_t0, vn)

    assert_equal 79.300918, result
  end

  def test_should_calculate_another_nominal_value
    factor = 0.238974
    ipca_t = 756.2222
    ipca_t0 = 9998.123
    vn = 1034.56

    result = NtnB.calculate_nominal_value(factor, ipca_t, ipca_t0, vn)

    assert_equal 18.699813, result
  end

  def test_should_truncate_nominal_value_with_six_decimal_places
    factor = 256.127
    ipca_t = 1000.254
    ipca_t0 = 23.55
    vn = 9998.99

    result = NtnB.calculate_nominal_value(factor, ipca_t, ipca_t0, vn)

    assert_in_delta 108775448.348330, result, EPS_SIX
  end

  def test_should_calculate_income_factor
    ipca_t1 = 245.111
    ipca_t0 = 230.2390
    dc = 128
    dct = 62

    result = NtnB.calculate_income_factor(ipca_t1, ipca_t0, dc, dct)

    assert_equal 1.1379459217055752, result
  end

  def test_should_calculate_another_income_factor
    ipca_t1 = 0.3333
    ipca_t0 = 0.11123224
    dc = 130
    dct = 25

    result = NtnB.calculate_income_factor(ipca_t1, ipca_t0, dc, dct)

    assert_equal 300.8458871466185, result
  end

  def test_should_calculate_interest
    vna = 1003.1232323
    factor = 16.99999

    result = NtnB.calculate_interest(vna, factor)

    assert_equal 16049.961685, result
  end

  def test_should_calculate_another_interest
    vna = 998.9938
    factor = 125.2323

    result = NtnB.calculate_interest(vna, factor)

    assert_equal 124107.297459, result
  end

  def test_should_truncate_interest_with_six_decimal_places
    vna = 16.10101
    factor = 2.56777

    result = NtnB.calculate_interest(vna, factor)

    assert_in_delta 25.242680, result, EPS_SIX
  end

  def test_should_calculate_interest_factor
    i = 18.99
    n = 3
    dcp = 25
    dct = 13

    result = NtnB.calculate_interest_factor(i, n, dcp, dct)

    assert_equal 1.08718413, result
  end

  def test_should_calculate_another_interest_factor
    i = 127.2134
    n = 6
    dcp = 120
    dct = 90

    result = NtnB.calculate_interest_factor(i, n, dcp, dct)

    assert_equal 1.72831391, result
  end

  def test_should_truncate_interest_factor_with_eight_decimal_places
    i = 0.18
    n = 11
    dcp = 365
    dct = 28

    result = NtnB.calculate_interest_factor(i, n, dcp, dct)

    assert_in_delta 1.02172215, result, EPS_EIGHT
  end

end
