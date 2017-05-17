class Ltn

  def self.calculate_unit_price t_ind
    (1000/((1+t_ind.round(2))**(1/252.0))).round(6)
  end

end
