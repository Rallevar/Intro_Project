module ApplicationHelper
  def toggle_direction(column)
    if params[:sort] == column && params[:direction] == 'asc'
      'desc'
    else
      'asc'
    end
  end
end
