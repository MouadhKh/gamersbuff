module ApplicationHelper
  def html_button_to(html = nil, options = nil, html_options = nil)
    button_to(options, html_options) do
      html
    end
  end

  def title(page_title)
    content_for(:title) {page_title}
  end
end
