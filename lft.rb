require 'bigdecimal'
require 'bigdecimal/util'

class Lft

  def self.calculate_nominal_value vnb, c
    (vnb.to_d.truncate(6).to_f*c.round(8)).to_d.truncate(6).to_f
  end

  def self.calculate_result_factor *tselic
    tselic.each_with_index {|k,v| tselic[v] = k.round(8)+1}
    tselic.reduce(:*).round(8)
  end

  def self.calculate_selic_tax selic
    (((((selic.to_d.truncate(2).to_f/100)+1)**(1/252.0))-1).round(9)).to_d.truncate(8).to_f
  end

  def self.calculate_nominal_value_a c, ve, tac, du, dut, pa, n
    ((c*(ve).to_d.truncate(6).to_f*(1+((tac/100.0)**(du/(dut*1.0)))))-(c*(ve).to_d.truncate(6).to_f*((1+tac)**(du/(dut*1.0))))*(1.0/((pa-n)*1.0))).to_d.truncate(6).to_f
  end

end
