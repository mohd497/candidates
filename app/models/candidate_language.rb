class CandidateLanguage < ApplicationRecord
  belongs_to :job_candidate
  belongs_to :programming_language
end
