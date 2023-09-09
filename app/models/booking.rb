class Booking < ApplicationRecord
   belongs_to :driver
   enum :status, [ :IN_PROGRESS, :COMPLETED, :CANCELLED ]
end
