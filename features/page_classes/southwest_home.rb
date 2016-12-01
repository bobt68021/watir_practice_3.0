class SouthwestHome
  include PageObject
  page_url 'https://www.southwest.com/'

  text_field(:departure_airport, :id => 'air-city-departure')
  text_field(:arrival_airport, :id => 'air-city-arrival')
  div(:departure_date, :class => 'js-depart-date-label booking-form--label booking-form--date-container-label')
  div(:return_date, :class => 'js-return-date-label booking-form--label booking-form--date-container-label')

  def search
    @browser.button(:id => 'jb-booking-form-submit-button').click
  end

end