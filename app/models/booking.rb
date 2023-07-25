class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :user
  enum :status, { pending: 0, confirmed: 1, rejected: 2}
end
