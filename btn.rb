require 'bigdecimal'
require 'bigdecimal/util'

class Btn

  def self.calculate_unit_price pu_ant, tr
    truncated_pu_ant = pu_ant.to_d.truncate(6).to_f
    truncated_pu_ant * tr
  end

  def self.calculate_interest pu_at, fj
    pu_at * fj
  end

  def self.calculate_interest_rate i, n
    (((1 + (i / 100.0)) ** (n / 12.0)) - 1).round(8)
  end
end
