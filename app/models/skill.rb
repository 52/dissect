class Skill < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :percent_utilized

  after_initialize :set_default_badge

  private

  def set_default_badge
    self.badge = Placeholder.image_generator width: 250, height: 250
  end
end
