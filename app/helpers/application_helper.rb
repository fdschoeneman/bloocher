module ApplicationHelper

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

    content_tag(:li, class: class_name) do
      link_to text, path
    end
  end

  # def winery_wine_review_modal

  #   bootstrap_modal(dom_id: 'a_dom_id', fade: true, header_title: "I'm a bootstrap modal popup") do |modal|
  #     modal.body do |c|
  #      c."some content"
  #     end
  #     modal.footer do |f|
  #       f.bootstrap_button "Save", "url", :type => 'btn-primary'
  #       f.bootstrap_button "Cancel", "url"
  #     end
  #   end
  # end

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
