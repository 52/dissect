class ChangeImageForPortfolios < ActiveRecord::Migration[5.1]
  def change
    remove_column :portfolios, :main_image,  :text
    remove_column :portfolios, :thumb_image, :text
    add_column    :portfolios, :image,       :text
  end
end
