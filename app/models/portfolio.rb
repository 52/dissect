class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: :all_blank

  validates_presence_of :title, :body

  scope :angular,       ->{where subtitle: "Angular"}
  scope :ruby_on_rails, ->{where subtitle: "Ruby on Rails"}
  scope :by_position,   ->{order position: :asc}

  mount_uploader :main_image,  PortfolioUploader
  mount_uploader :thumb_image, PortfolioUploader
end
