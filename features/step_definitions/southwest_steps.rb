include PageObject::PageFactory

When(/^I search for a flight using the default dates$/) do
  visit_page(SouthwestHome)
  on_page(SouthwestHome) do |page|
    @departure_date = page.departure_date
    @return_date = page.return_date
    page.departure_airport = 'CLE'
    page.arrival_airport = 'FLL'
    page.search
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page(SouthwestFlights) do |page|
    highlighted_departure_date = page.highlighted_departure_date
    expect(Date.parse(highlighted_departure_date)).to eq Date.parse(@departure_date)
    highlighted_return_date = page.highlighted_return_date
    expect(Date.parse(highlighted_return_date)).to eq Date.parse(@return_date)
  end
end

And(/^I can't choose a departure date from the past$/) do
  on_page(SouthwestFlights) do |page|
    page.calendar_tabs.each do |day|
      if Date.parse(day.attribute('carouselfulldate')) < Date.today
        expect(day.span_element(:class => 'screenreader-only').text.include? "Day is not available")
        expect(day.attribute('class')).to eq 'carouselDisabled'
      else
        expect(day.span_element(:class => 'screenreader-only').text.include? "Change Depart trip date to")
        expect(day.attribute('class')).to eq('carouselEnabledSodaIneligible').or(eq('carouselTodaySodaIneligible'))
      end
    end
  end
end