module Strategies
  class PriceCalculatorStrategy
    # trying to make pricestrategy
    def initialize(distance)
      @distance = distance
    end

    def make_price_sedan
      per_km_price = 10
      price = 0
      tmp_dst = 0

      if tmp_dst <= [10, @distance].min
        tmp_dst += [10, @distance].min
        price = per_km_price * tmp_dst
      end

      while @distance > tmp_dst
        per_km_price = case tmp_dst
                       when 0...50
                         15
                       when 50...100
                         17
                       else
                         20
                       end
        price += per_km_price * [10, @distance - tmp_dst].min
        tmp_dst += [10, @distance - tmp_dst].min
      end

      price += per_km_price * (@distance - tmp_dst) if (@distance - tmp_dst).positive?

      puts price
      price
    end

    def make_price_prime
      per_km_price = 10
      price = 0
      tmp_dst = 0

      if tmp_dst <= [10, @distance].min
        tmp_dst += [10, @distance].min
        price = per_km_price * tmp_dst
      end

      while @distance > tmp_dst
        per_km_price = case tmp_dst
                       when 0...50
                         17
                       when 50...100
                         20
                       else
                         22
                       end
        price += per_km_price * [10, @distance - tmp_dst].min
        tmp_dst += [10, @distance - tmp_dst].min
      end
      price += per_km_price * (@distance - tmp_dst) if (@distance - tmp_dst).positive?

      price
    end
  end
end
