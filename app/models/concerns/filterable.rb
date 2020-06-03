module Filterable
  extend ActiveSupport::Concern

  module ClassMethods

    def filter(params)
      if params["search"]
        filter = params["search"]["name"]
        results = self.candidate_search("#{filter}")
      else
        results = self.all
      end
      results
    end

  end
end