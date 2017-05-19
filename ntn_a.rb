require 'bigdecimal'
require 'bigdecimal/util'

class NtnA

  def self.calculate_amortization_unit_price uss_a, uss_b, emission_value, amort_perc
    liquid_value = calculate_liquid_value(emission_value, amort_perc)
    (((uss_a * 1.0)/ uss_b) * liquid_value).round(6)
  end

  def self.calculate_liquid_value emission_value, amort_perc
    emission_value * amort_perc
  end

  def self.calculate_interest amortized_unit_price, factor_list
    (amortized_unit_price * factor_list.reduce(:+)).to_d.truncate(6).to_f
  end

  def self.calculate_interests_sum factor_list
    sum = 0
    factor_list.each do |factor|
      sum = sum + (((factor[:dtp] - factor[:dtup]) / 360.0) * (factor[:i] / 100.0))
    end

    sum
  end

end
