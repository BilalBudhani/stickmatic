require 'spec_helper'

feature "Login" do

  context "via Instagram" do
    before(:each) do
      stub_request(:get, /api.instagram.com/)
        .to_return(:status => 200, :body => File.new(File.dirname(__FILE__)+'/../fixtures/user_recent_media.json'))
    end

    scenario "User", js: true do
      visit "/"
      click_on "Login"
      expect(page.find('#navbar')).to have_text("Hi")
    end
  end
end