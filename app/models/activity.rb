class Activity < ApplicationRecord
  validates :name, :date_start, :date_end, presence: true
  validate :verify_date

  belongs_to :project
  after_destroy :update_project
  after_create :update_project

  def update_project
    self.project.save
  end

end
