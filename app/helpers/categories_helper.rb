module CategoriesHelper
  def subcats(categories)
    categories.map do |category, sub_categories|
      render(category) + content_tag(:div, subcats(sub_categories), :class => "subcats")
    end.join.html_safe
  end
end
