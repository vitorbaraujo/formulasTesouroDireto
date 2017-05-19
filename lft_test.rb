require 'minitest/autorun'
require_relative 'lft'

class LftTest < Minitest::Test

  def test_should_calculate_nominal_value
    vnb = 4.687896
    c = 1.78985698
    result = Lft.calculate_nominal_value(vnb, c)

    assert_equal 8.390663, result
  end

  def test_should_calculate_another_nominal_value
    vnb = 7.985631
    c = 4.14789658
    result = Lft.calculate_nominal_value(vnb, c)

    assert_equal 33.123571, result
  end

  def test_should_value_stay_the_same_with_more_decimals
    vnb = 4.68789687551
    c = 1.78985698455454
    result = Lft.calculate_nominal_value(vnb, c)

    assert_equal 8.390663, result
  end

  def test_should_calculate_result_factor
    tselic = [3.47896547, 3.6547896, 7.9365478]
    result = Lft.calculate_result_factor(*tselic)

      assert_equal result, 186.31488480
  end

  def test_should_calculate_another_result_factor
    tselic = [3.47896547, 3.6547896]
    result = Lft.calculate_result_factor(*tselic)

    assert_equal result, 20.84864189
  end

  def test_should_calculate_selic_tax
    selic = 3.89
    result = Lft.calculate_selic_tax(selic)

    assert_equal 0.00015145, result
  end

  def test_should_calculate_another_selic_tax
    selic = 4.78
    result = Lft.calculate_selic_tax(selic)

    assert_equal 0.00018530, result
  end
end
