require File.dirname(__FILE__) + '/spec_helper'

describe "testing" do

  it "loads the home page" do
    visit "/index.html"
    page.should have_content "I'm an HTML5 template"
  end

  it "should test Google" do
    visit "http://www.google.com/"
    fill_in "gbqfq", :with => "Capybara"
    page.should have_content "jnicklas/capybara"
  end
end
