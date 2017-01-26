class Job < ApplicationRecord
  validates :title, :wage_lower_bound, :wage_upper_bound, :company, :location, :category, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
  validates :wage_upper_bound, numericality: { greater_than: :wage_lower_bound }

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }

  has_many :resumes

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end
end
