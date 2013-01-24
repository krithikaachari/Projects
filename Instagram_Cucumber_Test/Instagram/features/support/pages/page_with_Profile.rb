module PageWithProfile
  include Gizmo::PageMixin

  def valid?
    title.should =~ /.*Edit Profile.*/
  end

  def title
    find(:xpath, "//title").text
  end
   
end