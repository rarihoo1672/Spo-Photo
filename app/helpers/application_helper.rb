module ApplicationHelper
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <li class="alert-lists__list">
          <p class="alert-lists__list__message">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end
end
