module ApplicationHelper

  def title
    base_title = "Bloocher"
    if @page_title.nil?
      base_title
    else
      "#{base_title} | #{@page_title}"
    end
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def pluralize_array(word, array)
    case  
    when array.count == 1
      word
    when array.count == 0
      return
    when array.count > 1
      word.pluralize
    end
  end


  def default_meta_tags
    
    {
      title:       'Bloocher',
      description: 'Tracking wines and vineyards since 2013.',
      keywords:    'Wines, Wine Reviews, Wineries, Oenophiles',
      separator:   "&mdash;".html_safe,
    }
  
  end

  def nav_link_to(text, path)
    class_name = current_page?(path) ? 'active' : ''

    content_tag(:li, class: "#{class_name}") do
      link_to text, path
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
