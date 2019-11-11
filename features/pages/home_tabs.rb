require 'selenium-webdriver'
require 'json'

class HomeTab

  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new :timeout => 15
  end

  def tab_vertrage
    vertrage = @wait.until{
      element = @browser.find_element :xpath, '//*[@id="ember3"]/div/div/div/main/header/nav/div[1]/a[1]'
      element if element.displayed?
    }
    return vertrage
  end

  def find_all_contracts
    all_contracts = []
    all = @wait.until{
      element = @browser.find_elements :class_name, 'cucumber-contract-status'
    }
    all.each do |con|
      all_contracts.push con.text
    end
    return all_contracts
  end

  def tab_rente
    rente = @wait.until{
      element = @browser.find_element :xpath, '//*[@id="ember3"]/div/div/div/main/header/nav/div[1]/a[3]'
      element if element.displayed?
    }
    return rente
  end

  def get_retirement_income
    income = @wait.until{
      element = @browser.find_element :class_name, '_actual-income__value_1aoxqn'
      element if element.displayed?
    }
    
    return income
  end

  def tab_bedarf
    bedarf = @wait.until{
      element = @browser.find_element :xpath, '//*[@id="ember3"]/div/div/div/main/header/nav/div[1]/a[2]'
      element if element.displayed?
    }
    return bedarf
  end

  def pop_up_close
    element = @browser.find_element :xpath, '//*[@id="numberOneRecModal"]/div/i'
    element.click if element.displayed?
    sleep 1
  end

  def active_slide
    active = @wait.until{
      element = @browser.find_element :class_name, 'swiper-slide-active'
      element if element.displayed?
    }
    return active
  end

  def recommended_products_left
    recommended = @wait.until{
      element = active_slide.find_element :class_name, 'manager__optimisations__optimisation-list__done__title'
      element if element.displayed?
    }
    return recommended
  end
  
  def recommend_clark_now
    recommend = @wait.until{
      element = active_slide.find_element :class_name, 'manager__optimisations__optimisation-list__done__link--text'
      element if element.displayed?
    }
    return recommend
  end

  def refer_friend_title
    refer = @wait.until{
      element =  @browser.find_element :class_name, 'refer-friend__intro__title'
      element if element.displayed?
    }

    resp = false
    resp = true if refer.text.length > 7 
    return resp
  end

  def invite_by_mail
    email_field = @wait.until{
      element = @browser.find_element :id, 'email'
      element if element.displayed?
    }
    sleep 1
    return email_field
  end

  def send_invitation_mail
    send_button = @wait.until{
      element = @browser.find_element :id, 'sendInvitationEmail'
      element if element.displayed?
    }
    return send_button
  end

  def success_send_invite
    success = @wait.until{
      element = @browser.find_element :class_name, 'success-text'
      element if element.displayed?
    }
    return success
    
  end

end