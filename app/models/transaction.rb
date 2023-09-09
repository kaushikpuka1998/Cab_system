class Transaction < ApplicationRecord
    enum: status, [:SUCCESS, :FAILED,:NOT_STARTED], default: :NOT_STARTED
end
