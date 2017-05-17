require 'minitest/autorun'
require_relative 'ltn'

class LtnTest < Minitest::Test

  def test_should_calculate_unit_price
    t_ind = 4.68
    result = Ltn.calculate_unit_price(t_ind)

    assert_equal 993.131036, result
  end

  def test_should_calculate_another_unit_price
    t_ind = 3.698
    result = Ltn.calculate_unit_price(t_ind)

    assert_equal 993.877697, result
  end

  def test_should_rouding_not_change_result
    t_ind = 3.70
    result = Ltn.calculate_unit_price(t_ind)

    assert_equal 993.877697, result
  end

end
