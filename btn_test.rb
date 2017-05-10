require 'minitest/autorun'
require_relative 'btn'

class BtnTest < Minitest::Test
  def test_should_calculate_unit_price
    pu_ant = 1000.000000
    tr = 0.230000
    result = Btn.calculate_unit_price(pu_ant, tr)
    assert_in_delta 230.000000, result, 0.0000001
  end

  def test_should_calculate_another_unit_price
    pu_ant = 500.000000 
    tr = 0.230000
    result = Btn.calculate_unit_price(pu_ant, tr)
    assert_in_delta 115.000000, result, 0.0000001
  end
end
