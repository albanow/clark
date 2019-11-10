
require_relative '../pages/login.rb'
require 'json'
path = File.join(File.dirname(File.dirname(File.absolute_path(__FILE__))),'support/test_data.json')
file = File.read path 
test_data = JSON.parse file 

Given /^I am in clark website page$/ do
  @site = Login.new "https://www.clark.de/"
end

Then /^I click on Einloggen button$/ do
  @site.top_login_button.click
  expect(@site.login_page.text).to eq('Login')
end

Then /^I enter invalid credentials email and password$/ do 
  @site.user_email.send_keys test_data['prod_wrong_email']
  @site.user_password.send_keys test_data['prod_wrong_password']
end

When /^I click on Login button$/ do
  @site.login_button.click
end

Then /^I see an error message$/ do
  expect(@site.invalid_credentials.text).to eq('E-Mail-Adresse oder Passwort ungültig.')
end

Then /^I see Login page again$/ do
  expect(@site.login_page.text).to eq('Login')
end

Then /^I enter valid credentials email and password/ do
  @site.user_email.send_keys test_data['prod_email']
  @site.user_password.send_keys test_data['prod_password']
end

When /^I click on Login button again$/ do
  @site.login_button.click
end

Then /^I see home page is displayed with a user profile icon on top right side$/ do
  @site.profile_displayed
end