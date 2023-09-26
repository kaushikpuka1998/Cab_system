module Strategies
  class CabSelectionStrategy
    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def select_cab
      cab = Location.finding_fiftykm_nearest_cab(latitude, longitude)
      cab_detail(cab.cab)
    end
  end
end
