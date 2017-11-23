module ApplicationHelper
  def vacancy_link(str, id = nil)
    if str == "○"
      link_to str, new_user_reservation_path(time_table_id: id)
    else
      str
    end
  end
end
