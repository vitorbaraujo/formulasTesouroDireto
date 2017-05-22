require 'bigdecimal'
require 'bigdecimal/util'

class NtnA3

  def self.calculate_nominal_value uss_a, uss_b
    (uss_a * 1000.0 / uss_b).to_d.truncate(6).to_f
  end

  def self.calculate_interest updated_nominal_value, factor
    (updated_nominal_value * factor).to_d.truncate(6).to_f
  end

  def self.calculate_interest_factor i, n
    ((i / 100.0) * (n / 12.0)).to_d.truncate(8).to_f
  end

end
