
require_relative '../pages/login.rb'

Given /^I am in clark website page$/ do
  @login = Login.new(@browser)
end

Then /^I click on Einloggen button$/ do
  @login.top_login_button.click
  expect(@login.login_page.text).to eq('Login')
end

Then /^I enter invalid credentials email and password$/ do 
  @login.user_email.send_keys $test_data['prod_wrong_email']
  @login.user_password.send_keys $test_data['prod_wrong_password']
end

When /^I click on Login button$/ do
  @login.login_button.click
end

Then /^I see an error message$/ do
  expect(@login.invalid_credentials.text).to eq($test_data['prod_wrong_email_pass'])
end

Then /^I see Login page again$/ do
  expect(@login.login_page.text).to eq('Login')
end

Then /^I enter valid credentials email and password/ do
  @login.user_email.send_keys $test_data['prod_email']
  @login.user_password.send_keys $test_data['prod_password']
end

When /^I click on Login button again$/ do
  @login.login_button.click
  sleep 3
end

Then /^I see home page is displayed with a user profile icon on top right side$/ do
  @login.profile_displayed
end