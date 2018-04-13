module PortfoliosHelper
  # Return image for the given portfolio item
  def portfolio_item_image portfolio_item, image_type
    image_url = portfolio_item.send("#{image_type}_image").url
    if image_url.nil?
      if image_type == "thumb"
        "https://via.placeholder.com/300x200"
      else
        "https://via.placeholder.com/600x400"
      end
    else
      image
    end
  end
end
