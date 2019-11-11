Before do
  @browser = Selenium::WebDriver.for :chrome
  @browser.manage.window.maximize

  path = File.join(File.dirname(File.dirname(File.absolute_path(__FILE__))),'support/test_data.json')
  file = File.read path 
  $test_data = JSON.parse file 
end

After do
  @browser.quit
end