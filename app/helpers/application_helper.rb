module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language || :text).div
    end
  end
  
  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  # pass in data attributes like method, remote, url
  # def render_with_checkboxes(text, data_options={})
  #   checkbox_regex  = /-\s?\[(x|\s)\]/
  #   text.gsub(checkbox_regex).with_index do |current_match, current_index|
  #     checked = current_match =~ /x/ ? true : false
  #     body = text.gsub(checkbox_regex).with_index do |match, index|
  #       if index == current_index
  #         checked ? "- [ ]" : "- [x]"
  #       else
  #         match
  #       end
  #     end
  #     check_box_tag "check_#{current_index}", "", checked, data: data_options
  #   end
  #   render(text)
  # end
end
