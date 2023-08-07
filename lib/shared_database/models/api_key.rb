class APIKey < ActiveRecord::Base
    validates :api_key, uniqueness: true
    after_initialize :set_defaults

    def set_defaults
        self.count ||= 0
    end
end
  