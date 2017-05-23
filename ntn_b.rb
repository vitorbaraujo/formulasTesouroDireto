require 'bigdecimal'
require 'bigdecimal/util'

class NtnB

  def self.calculate_nominal_value factor, ipca_t, ipca_t0, vn
    (factor * ((ipca_t * 1.0) / ipca_t0) * vn).to_d.truncate(6).to_f
  end

  def self.calculate_income_factor ipca_t1, ipca_t0, dc, dct
    ((ipca_t1 * 1.0) / ipca_t0) ** ((dc * 1.0) / dct)
  end

  def self.calculate_interest vna, factor
    (vna * (factor - 1)).to_d.truncate(6).to_f
  end

  def self.calculate_interest_factor i, n, dcp, dct
    ((((i / 100.0) + 1) ** (n / 12.0)) ** ((dcp * 1.0) / dct)).to_d.truncate(8).to_f
  end

end
