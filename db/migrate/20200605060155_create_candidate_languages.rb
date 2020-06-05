class CreateCandidateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :candidate_languages do |t|
      t.references :job_candidate, foreign_key: true
      t.references :programming_language, foreign_key: true

      t.timestamps
    end
  end
end
