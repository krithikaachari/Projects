module PageWithInstagram
  include Gizmo::PageMixin

  def valid?
    if title =~ /.*Instagram.*/
      return true
    else
      return false
    end
  end

  def title
    find(:xpath, "//title").text
  end

  def fill_in_username uname
    fill_in 'username', :with=> uname
  end

  def fill_in_password pword
    fill_in 'password', :with=> pword
  end

  def click_login_button
    click_button "Log in"
  end
  
end