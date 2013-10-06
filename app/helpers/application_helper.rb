module ApplicationHelper
  def html_title
    base_title = 'Zeropaste'
    if content_for? :title
      "#{content_for(:title)} | #{h base_title}".html_safe
    else
      base_title
    end
  end
end
