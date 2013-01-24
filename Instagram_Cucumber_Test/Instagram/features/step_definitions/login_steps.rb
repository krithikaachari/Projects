Given /^I am on the instagram login page$/ do
  visit "http://www.instagram.com/accounts/login"
end

Given /^I give "(.*?)" for username$/ do |uname|
  on_page_with :Instagram do |page|
    page.fill_in_username uname
  end
end

Given /^I give "(.*?)" for password$/ do |pword|
  on_page_with :Instagram do |page|
    page.fill_in_password pword
  end
end

When /^I click on the login button$/ do
  on_page_with :Instagram do |page|
    page.click_login_button
  end
end

Then /^I should land on edit profile page$/ do
  on_page_with :Profile do |page|
    page.valid?.should == true
  end
end

And /^I should have "(.*?)" on top of the page$/ do |uname|
  on_page_with :Profile do |page|
    page.should have_content(uname)
  end
end

Then /^I should see error on page$/ do
  on_page_with :Instagram do |page|
    page.should have_content('Please enter a correct username and password')
  end
end

And /^I should be on login page$/ do
  on_page_with :Instagram do |page|
    page.valid?.should == true
  end
end