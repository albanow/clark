require 'selenium-webdriver'

class Login
  
  def initialize(url)
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize
    @driver.navigate.to url
    @wait = Selenium::WebDriver::Wait.new :timeout => 15
  end

  def top_login_button
    top_login = @wait.until{
      element = @driver.find_element :link_text, 'Einloggen'
      element if element.displayed?
    }
    return top_login
  end

  def login_page
    login = @wait.until{
      element = @driver.find_element :xpath, '//form[@id="new_user"]/div[1]/h3'
      element if element.displayed?
    }
    return login
  end

  def user_email
    email_field = @wait.until{
      element = @driver.find_element :id, 'user_email'
      element if element.displayed?
    }
    sleep 1
    return email_field
  end

  def user_password
    password_field = @wait.until{
      element = @driver.find_element :id, 'user_password'
      element if element.displayed?  
    }
    return password_field
  end
  
  def login_button
    login =  @wait.until{
      element = @driver.find_element :name, 'commit'
      element if element.displayed?
    }
    return login
  end

  def invalid_credentials
    message = @wait.until{
      element = @driver.find_element :class, 'page-header__flash--failure'
      element if element.displayed?
    }
    return message
  end

  def profile_displayed
    profile = @wait.until{
      element = @driver.find_element :id, 'profile-ico'
      element if element.displayed?
    }
    return profile
  end

  def close_browser
    @driver.quit
  end

  def screenshot
    @driver.save_screenshot("screenshot.png")
  end
end