class Portfolio < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :angular,       ->{where subtitle: "Angular"}
  scope :ruby_on_rails, ->{where subtitle: "Ruby on Rails"}

  after_initialize :set_default_images

  private

  def set_default_images
    self.main_image  ||= Placeholder.image_generator width: 600, height: 400
    self.thumb_image ||= Placeholder.image_generator width: 300, height: 200
  end
end
