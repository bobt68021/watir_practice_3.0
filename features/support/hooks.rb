require 'watir-webdriver'
require 'page-object'
require 'date'

Before do
  @browser = Watir::Browser.new :chrome
end

After do
  @browser.close
end
