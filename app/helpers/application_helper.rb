module ApplicationHelper
  def vacancy_link(str, id = nil)
    if str == "◯"
      session[:time_table_id] = id
      link_to str, new_user_reservation_path, style: "color: red;"
    else
      str
    end
  end
end
