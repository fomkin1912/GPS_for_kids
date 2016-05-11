module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
      content_tag("div", attributes, &block)
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end
  
  def logged_in?
    !current_user.nil?
  end
  
end