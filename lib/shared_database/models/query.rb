class Query < ActiveRecord::Base
    validates :query, uniqueness: true
    after_initialize :set_defaults

    def set_defaults
        self.usage ||= 0
    end
end
  