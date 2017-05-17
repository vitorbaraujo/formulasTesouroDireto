require 'bigdecimal'
require 'bigdecimal/util'

class NtnA

  def self.calculate_amortization_unit_price uss_a, uss_b, liquid_value
    (((uss_a * 1.0)/ uss_b) * liquid_value).round(6)
  end

  def self.calculate_liquid_value emission_value, amort_perc
    emission_value * amort_perc
  end

end
