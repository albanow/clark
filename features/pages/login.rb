require 'selenium-webdriver'
require 'json'

##
# This class is a page object for the login flow in the website
class Login

  ##
  # Creates a new log page object to initialize a user defined browser
  #
  # At first it navigates to a url (defined in json test data)
  #
  # 15 second wait timeout created

  def initialize(browser)
    @browser = browser
    @browser.navigate.to($test_data['prod_url'])
    @wait = Selenium::WebDriver::Wait.new :timeout => 15
  end

  ## 
  # It finds Login button at top in main page

  def top_login_button
    top_login = @wait.until{
      element = @browser.find_element :link_text, 'Einloggen'
      element if element.displayed?
    }
    return top_login
  end

  ##
  # Login text at top in login form

  def login_page
    login = @wait.until{
      element = @browser.find_element :xpath, '//form[@id="new_user"]/div[1]/h3'
      element if element.displayed?
    }
    return login
  end

  ##
  # E-mail text box in login page 

  def user_email
    email_field = @wait.until{
      element = @browser.find_element :id, 'user_email'
      element if element.displayed?
    }
    sleep 1
    return email_field
  end

  ##
  # Password text box in login page

  def user_password
    password_field = @wait.until{
      element = @browser.find_element :id, 'user_password'
      element if element.displayed?  
    }
    return password_field
  end
  
  ##
  # Login button in login page

  def login_button
    login =  @wait.until{
      element = @browser.find_element :name, 'commit'
      element if element.displayed?
    }
    return login
  end

  ##
  # Error message after trying to login with invalid credentials

  def invalid_credentials
    message = @wait.until{
      element = @browser.find_element :class, 'page-header__flash--failure'
      element if element.displayed?
    }
    return message
  end

  ##
  # Profile icon displayed at top-right after logged in

  def profile_displayed
    profile = @wait.until{
      element = @browser.find_element :id, 'profile-ico'
      element if element.displayed?
    }
    return profile
  end

  ## 
  # Take an screenshot with selenium webdriver

  def screenshot
    @browser.save_screenshot("screenshot.png")
  end

  ##
  # Complete flow to login in website

  def login_clark
    top_login_button.click
    login_page.text
    
    user_email.send_keys($test_data['prod_email'])
    user_password.send_keys($test_data['prod_password'])

    login_button.click
    sleep 3
    profile_displayed
  end

end