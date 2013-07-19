require File.dirname(__FILE__) + '/spec_helper'

describe "dealing with popups" do
  it "displays age that the user filled in" do
    visit "/prompt.html"
    prompt = page.driver.browser.switch_to.alert
    prompt.send_keys('15')
    prompt.accept
    page.should have_content "You are 15 years old."
  end

end
