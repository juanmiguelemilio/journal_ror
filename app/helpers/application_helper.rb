module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language || :text).div
    end
  end

  def is_logged_in?
    !!session[:user_id]
  end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if is_logged_in?
  # end
  
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

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    flash[:notice] = I18n.t(:sign_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    flash[:notice] = I18n.t(:sign_out) if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  
  
end
