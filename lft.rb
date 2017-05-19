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

end
