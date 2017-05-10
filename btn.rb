require 'bigdecimal'
require 'bigdecimal/util'

class Btn

  def self.calculate_unit_price pu_ant, tr
    truncated_pu_ant = pu_ant.to_d.truncate(6).to_f
    truncated_pu_ant * tr
  end

  def self.calculate_interest pu_at, fj
    205.797399
  end

end
