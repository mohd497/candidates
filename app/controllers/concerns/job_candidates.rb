module JobCandidates
  extend ActiveSupport::Concern

  def self.add_search_tech(job_candidate)
    if job_candidate.resume.attached? && job_candidate.resume.content_type.in?(%w(application/pdf))

      File.open(ActiveStorage::Blob.service.path_for(job_candidate.resume.key), "rb") do |io|
        reader = PDF::Reader.new(io)
        reader.pages.each do |page|
          candidate_resume = page.text.to_s
          ProgrammingLanguage.all.each do |lang|
            if candidate_resume.downcase.include? lang.title.downcase
              job_candidate.programming_languages << lang
              job_candidate.save
            end
          end
        end
      end

    elsif job_candidate.resume.attached? && job_candidate.resume.content_type.in?(%w(application/vnd.openxmlformats-officedocument.wordprocessingml.document))

      doc = Docx::Document.open(ActiveStorage::Blob.service.path_for(job_candidate.resume.key))
      doc.paragraphs.each do |page|
        candidate_resume = page.text.to_s
        ProgrammingLanguage.all.each do |lang|
          if candidate_resume.downcase.include? lang.title.downcase
            job_candidate.programming_languages << lang
            job_candidate.save
          end
        end
      end

    else

    end
  end
end