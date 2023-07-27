class Job < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location_and_description_and_price,
    against: [ :name, :location, :description, :price ],
    associated_against: {
      user: [:first_name]
    },
    using: {
      tsearch: { prefix: true } # tsearch is full text search
  }
end
