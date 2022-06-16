class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def verify_date
    if self.date_start > self.date_end
      self.errors.add(:date_start, ' não pode ser maior que a Data Final')
    end
  end
end

