require 'bigdecimal'
require 'bigdecimal/util'

class NtnA6

  def self.calculate_updated_nominal_value uss_a, uss_b, ve
    (((uss_a * 1.0) * uss_b) / ve).to_d.truncate(6).to_f
  end

  def self.calculate_interest factor, vna
    (factor * vna).to_d.truncate(6).to_f
  end

  def self.calculate_interest_rate dtp, dtup, i
    ((((dtp - dtup) / 360.0) * (i / 100.0))).to_d.truncate(8).to_f
  end

end
