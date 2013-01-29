require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Test" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://instagram.com/accounts/login/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_" do
    @driver.get(@base_url + "/accounts/login/")
    @driver.find_element(:id, "id_username").clear
    @driver.find_element(:id, "id_username").send_keys "krithikaashok2010"
    @driver.find_element(:id, "id_password").clear
    @driver.find_element(:id, "id_password").send_keys "bubsu"
    @driver.find_element(:css, "input.button-green").click
    # Warning: verifyTextPresent may require manual changes
    verify { @driver.find_element(:css, "BODY").text.should =~ /^[\s\S]*Please enter a correct username and password\. Note that both fields are case-sensitive\.[\s\S]*$/ }
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert.text
  ensure
    @accept_next_alert = true
  end
end
