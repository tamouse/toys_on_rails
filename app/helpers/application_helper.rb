module ApplicationHelper

  def left_navbar
    content_tag(:ul, class: "nav navbar-nav navbar-left") do
      if employee_signed_in?
        who_is_logged_in(current_employee)
      elsif customer_signed_in?
        who_is_logged_in(current_customer)
      else
        who_is_logged_in(nil)
      end
    end
  end

  def right_navbar
    content_tag(:ul, class: "nav navbar-nav navbar-right") do
      if employee_signed_in?
        log_out_button(destroy_employee_session_path)
      elsif customer_signed_in?
        log_out_button(destroy_customer_session_path)
      else
        [
          content_tag(:li, button_to("Customer Login", new_customer_session_path, method: :get, form_class: "navbar-btn", class: "btn btn-primary")),
          content_tag(:li, "&nbsp;".html_safe),
          content_tag(:li, button_to("Employee Login", new_employee_session_path, method: :get, form_class: "navbar-btn", class: "btn btn-success"))
        ].join.html_safe
      end
    end
  end

  def who_is_logged_in(user = nil)
    if user.present?
      content_tag(:li, "Account #{user.account.name}, Employee #{user.email} logged in", class: "navbar-text")
    else
      content_tag(:li, "No one logged in", class: "navbar-text")
    end
  end

  def log_out_button(path)
    content_tag(:li, button_to("Log Out", path, method: :delete, form_class: "navbar-btn", class: "btn btn-primary"))
  end

end
