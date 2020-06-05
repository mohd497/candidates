class ProgrammingLanguage < ApplicationRecord

  has_many :candidate_languages
  has_many :job_candidates, through: :candidate_languages

end
