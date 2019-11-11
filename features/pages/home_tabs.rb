require 'selenium-webdriver'
require 'json'

##
# This class is a page object to get elements in the different tabs in home page
class HomeTab

  ##
  # Creates a new HomeTab page object to initialize a user defined browser
  #
  # 15 second wait timeout created

  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new :timeout => 15
  end

  ##
  # It finds Vertrage tab after login at top

  def tab_vertrage
    vertrage = @wait.until{
      element = @browser.find_element :xpath, '//*[@id="ember3"]/div/div/div/main/header/nav/div[1]/a[1]'
      element if element.displayed?
    }
    return vertrage
  end

  ##
  # It finds ALL contracts displayed in Vertrage tab

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

  ##
  # It finds Rente tab after login at top

  def tab_rente
    rente = @wait.until{
      element = @browser.find_element :xpath, '//*[@id="ember3"]/div/div/div/main/header/nav/div[1]/a[3]'
      element if element.displayed?
    }
    return rente
  end

  ##
  # It finds Retirement Income in euros

  def get_retirement_income
    income = @wait.until{
      element = @browser.find_element :class_name, '_actual-income__value_1aoxqn'
      element if element.displayed?
    }
    
    return income
  end

  ##
  # It finds Bedarf tab after login at top

  def tab_bedarf
    bedarf = @wait.until{
      element = @browser.find_element :xpath, '//*[@id="ember3"]/div/div/div/main/header/nav/div[1]/a[2]'
      element if element.displayed?
    }
    return bedarf
  end

  ## 
  # If popup appears after navigating to Bedarf tab , close it

  def pop_up_close
    element = @browser.find_element :xpath, '//*[@id="numberOneRecModal"]/div/i'
    element.click if element.displayed?
    sleep 1
  end

  ##
  # Active column in Bedarf (right or left)

  def active_slide
    active = @wait.until{
      element = @browser.find_element :class_name, 'swiper-slide-active'
      element if element.displayed?
    }
    return active
  end

  ##
  # Recommended Products text in left column

  def recommended_products_left
    recommended = @wait.until{
      element = active_slide.find_element :class_name, 'manager__optimisations__optimisation-list__done__title'
      element if element.displayed?
    }
    return recommended
  end
  
  ##
  # Recommend Clark Now text link in left column

  def recommend_clark_now
    recommend = @wait.until{
      element = active_slide.find_element :class_name, 'manager__optimisations__optimisation-list__done__link--text'
      element if element.displayed?
    }
    return recommend
  end

  ##
  # Refer Friend element at top (check text length)

  def refer_friend_title
    refer = @wait.until{
      element =  @browser.find_element :class_name, 'refer-friend__intro__title'
      element if element.displayed?
    }

    resp = false
    resp = true if refer.text.length > 7 
    return resp
  end

  ##
  # Invite mail text box in Refer Friend page

  def invite_by_mail
    email_field = @wait.until{
      element = @browser.find_element :id, 'email'
      element if element.displayed?
    }
    sleep 1
    return email_field
  end

  ##
  # Send invitation button in Refer friend page

  def send_invitation_mail
    send_button = @wait.until{
      element = @browser.find_element :id, 'sendInvitationEmail'
      element if element.displayed?
    }
    return send_button
  end

  ##
  # Send success message displayed clicking in send invitation button

  def success_send_invite
    success = @wait.until{
      element = @browser.find_element :class_name, 'success-text'
      element if element.displayed?
    }
    return success
  end

end