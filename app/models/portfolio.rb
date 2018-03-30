class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :angular,       ->{where subtitle: "Angular"}
  scope :ruby_on_rails, ->{where subtitle: "Ruby on Rails"}

  after_initialize :set_default_images

  private

  def set_default_images
    self.main_image  ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/300x200"
  end
end
