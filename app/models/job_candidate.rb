class JobCandidate < ApplicationRecord
  has_one_attached :resume

  include PgSearch::Model
  include Filterable

  pg_search_scope :candidate_search,
                  against: [:name],
                  using: {
                      tsearch: {prefix: true}
                  }

end
