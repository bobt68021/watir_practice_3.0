class SouthwestFlights
include PageObject

  li(:highlighted_departure_date, :id => 'carouselTodayDepart')
  li(:highlighted_return_date, :id => 'carouselTodayReturn')
  div(:calendar, :id => 'newDepartDateCarousel')

  def calendar_tabs
    calendar_element.list_item_elements
  end
end