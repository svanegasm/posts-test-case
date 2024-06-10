# app/helpers/devise_helper.rb
module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
      <span class="block sm:inline"><strong>#{sentence}</strong></span>
      <ul class="mt-3 list-disc list-inside text-sm">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
