require 'minitest/autorun'
require_relative 'ntn_a6'

class NtnA6Test < Minitest::Test

  EPS = 0.0000001
  EPS_EIGHT = 0.000000001

  def test_should_calculate_updated_nominal_value
    uss_a = 2.345678
    uss_b = 123.234234
    ve = 3.345252

    result = NtnA6.calculate_updated_nominal_value(uss_a, uss_b, ve)

    assert_equal 86.411376, result
  end

  def test_should_calculate_another_updated_nominal_value
    uss_a = 123.456789
    uss_b = 987.123234
    ve = 2222.89

    result = NtnA6.calculate_updated_nominal_value(uss_a, uss_b, ve)

    assert_equal 54.823704, result
  end

  def test_should_truncate_updated_nominal_value_to_six_decimal_places
    uss_a = 2223.3453
    uss_b = 665.787
    ve = 1222

    result = NtnA6.calculate_updated_nominal_value(uss_a, uss_b, ve)

    assert_in_delta 1211.353843, result, EPS
  end

  def test_should_calculate_interest
    factor = 1.123113223
    vna = 98.3123123

    result = NtnA6.calculate_interest(factor, vna)

    assert_equal 110.415857, result
  end

  def test_should_calculate_another_interest
    factor = 456.21322
    vna = 765.332323

    result = NtnA6.calculate_interest(factor, vna)

    assert_equal 349154.723445, result
  end

  def test_should_truncate_interest_with_six_decimal_places
    factor = 0.2223443
    vna = 0.567567

    result = NtnA6.calculate_interest(factor, vna)

    assert_in_delta 0.126195, result, EPS
  end

  def test_should_calculate_interest_rate
    dtp = 31
    dtup = 20
    i = 3.87

    result = NtnA6.calculate_interest_rate(dtp, dtup, i)

    assert_equal 0.0011825, result
  end

  def test_should_calculate_another_interest_rate
    dtp = 12
    dtup = 9
    i = 4.95

    result = NtnA6.calculate_interest_rate(dtp, dtup, i)

    assert_equal 0.0004125, result
  end

  def test_should_round_interest_rate_with_eight_decimal_places
    dtp = 31
    dtup = 2
    i = 9.53

    result = NtnA6.calculate_interest_rate(dtp, dtup, i)

    assert_in_delta 0.00767694, result, EPS_EIGHT
  end

end
