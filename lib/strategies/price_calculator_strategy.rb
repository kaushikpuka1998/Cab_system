module Strategies
    class PriceCalculatorStrategy
       #trying to make pricestrategy
        def initialize(distance)
            @distance = distance
        end
        def make_price_sedan
            per_km_price = 10
            price  = 0
            tmp_dst = 0 
            if tmp_dst <= [10, @distance].min
                tmp_dst+= [10, @distance].min
                price = per_km_price * tmp_dst
            end
            # puts "KKK #{tmp_dst}"
            while  @distance>tmp_dst
                #puts "#{ tmp_dst } === PPP #{price}"
                if  tmp_dst>=100
                    per_km_price = 20
                elsif tmp_dst>=50
                    per_km_price = 17
                else
                    per_km_price = 15
                end
                price = (price + (per_km_price * [10,@distance - tmp_dst].min ))
                tmp_dst += [10,@distance - tmp_dst].min
            end

            if @distance - tmp_dst>0
                price = (price + (per_km_price * (@distance - tmp_dst) ))
            end

            return price
        end

        def make_price_prime
            per_km_price = 7
            price  = 0
            tmp_dst = 0 
            if tmp_dst <= [10, @distance].min
                tmp_dst+= [10, @distance].min
                price = per_km_price * tmp_dst
            end
            # puts "KKK #{tmp_dst}"
            while  @distance>tmp_dst
                #puts "#{ tmp_dst } === PPP #{price}"
                if  tmp_dst>=100
                    per_km_price = 15
                elsif tmp_dst>=50
                    per_km_price = 12
                else
                    per_km_price = 10
                end
                price = (price + (per_km_price * [10,@distance - tmp_dst].min ))
                tmp_dst += [10,@distance - tmp_dst].min
            end

            if @distance - tmp_dst>0
                price = (price + (per_km_price * (@distance - tmp_dst) ))
            end

            return price
        end
    end
end