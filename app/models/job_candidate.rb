class JobCandidate < ApplicationRecord
  has_one_attached :resume
  has_many :candidate_languages, dependent: :destroy
  has_many :programming_languages, through: :candidate_languages

  validate :correct_document_mime_type

  include PgSearch::Model
  include Filterable

  pg_search_scope :candidate_search, associated_against: {
                    programming_languages: [:title]
                  },
                  using: {
                      tsearch: {prefix: true}
                  }

  private

  def correct_document_mime_type
    if resume.attached? && !resume.content_type.in?(%w(application/vnd.openxmlformats-officedocument.wordprocessingml.document application/pdf))
      errors.add(:document, 'Must be a PDF or a DOC file')
    end
  end

end
