class Project < ApplicationRecord
  validates :title, :description, :date_start, :date_end, presence: true
  validate :verify_date

  before_save :set_percentage
  before_save :set_is_late

  has_many :activities, dependent: :destroy

  def set_percentage
    if self.activities.size == 0
      self.percentage_complete = 0
    else
      total_activities = self.activities.size
      activities_finisheds = self.activities.select{|p| p.finished}.size
      self.percentage_complete = (100 / total_activities.to_f) * activities_finisheds
    end
  end

  def set_is_late
    if self.activities.size == 0 
      self.is_late = false 
    else
      self.activities.each do |act| 
        if act.date_end.to_date > self.date_end.to_date
          self.is_late = true 
          return
        else
          self.is_late = false
        end 
      end 
    end 
  end
end

