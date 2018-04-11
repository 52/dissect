module ApplicationHelper
  # Overwrite `current_user` helper of devise
  def current_user
    super || guest_user
  end

  def guest_user
    User.new name: "Guest User", email: "guest@local.com"
  end

  # View helper: Return title for a page
  def page_title title = ""
    title.empty? ? "Dissect" : title
  end

  # View helper: Return SEO keywords for a page
  def seo_keywords keywords = ""
    keywords.empty? ? "Rails 5 sample app" : keywords
  end

  # View helper: Show where users come from
  def referer_helper
    if session[:referer]
      greeting = "Thank you for visiting me from #{session[:referer]}"
      tag.div greeting, class: "referer-greeting"
    end
  end

  def copyright_generator
    DissectViewHelper::Renderer.copyright "Toan Nguyen", "All rights reserved."
  end
end
