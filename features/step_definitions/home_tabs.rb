require_relative '../pages/home_tabs.rb'
require_relative '../pages/login.rb'

Given ("I am in home page after logged in") do
  @login = Login.new(@browser)
  @login.login_clark
end

Then ("I launch tab Verträge") do
  @tabs = HomeTab.new(@browser)
  @vertrage = @tabs.tab_vertrage
  @vertrage.click
  sleep 2
end

When ("I am in tab Verträge") do
 expect(@vertrage.attribute("class")).to start_with 'is-active'
end

Then ("I see that there are three contracts with {string}") do |versichert|
  active_in_iu = @tabs.find_all_contracts.count(versichert.upcase)
  epected = $test_data['prod_active_contracts'].to_i 
  expect(active_in_iu).to eq(epected)
end

Then ("I launch tab Rente") do
  @rente = @tabs.tab_rente
  @rente.click
  sleep 2
end

When ("I am in tab Rente") do
 expect(@rente.attribute("class")).to start_with 'is-active'
end

When("I see that Dein Renteneinkommen is above {int} Euro") do |validate|
  
  resp = @tabs.get_retirement_income
  
  t = resp.text
  dot_index = t.tr!('€ ', '').index('.')
  comma_index = t.index(',')
  m = t[0..dot_index-1]
  c = t[dot_index+1..comma_index-1]
  d = t[comma_index+1..t.length]
  income = m + c +'.'+d
  income = income.to_f

  expect(income).to be >  validate.to_f
end

Then ("I launch tab Bedarf") do
  @bedarf = @tabs.tab_bedarf
  @bedarf.click
  sleep 2
  @tabs.pop_up_close
end

When ("I am in tab Bedarf") do
 expect(@bedarf.attribute("class")).to start_with 'is-active'
end

Then ("I see {string} in the left column") do |string|
  left_colum = @tabs.recommended_products_left.text
  expect(left_colum).to eq(string)
end

Then("I click on Clark jetzt empfehlen") do
  @tabs.recommend_clark_now.click
  sleep 2
  expect(@tabs.refer_friend_title).to eq(true)
end

Then("I enter Per E-Mail einladen") do
  @tabs.invite_by_mail.send_keys $test_data['prod_email_friend']
end

When("I click on E-Mail senden button") do
  @tabs.send_invitation_mail.click
end

Then("I see success message under the input field had been shown") do
  success = @tabs.success_send_invite.text
  expect(success).to eq($test_data['prod_success_invite_send'])
end