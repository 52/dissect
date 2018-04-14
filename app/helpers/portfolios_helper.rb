module PortfoliosHelper
  # Return image for the given portfolio item
  def portfolio_item_image portfolio_item, thumb: false
    image = portfolio_item.image

    if image.url.nil?
      thumb ? placeholder(width: 300, height: 200) : placeholder(width: 600, height: 400)
    else
      thumb ? image.thumb.url : image.url
    end
  end

  def placeholder width:, height:
    "https://via.placeholder.com/#{width}x#{height}"
  end
end
