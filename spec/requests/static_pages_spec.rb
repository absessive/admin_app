require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit root_path}
    
    it "should have the h1 'Admin App'" do
      page.should have_selector('h1', :text => 'Admin App')
    end
    
    it "should have the base title " do
      page.should have_selector('title', :text => 'Admin App')
    end
    
    it "should not have a custom base title" do
      page.should_not have_selector('title', :text => "| Home")
    end
  end
  
  describe "Help page" do
    before { visit help_path }
    it "should have the content Help'" do
      page.should have_content('Help')
    end
    
    it "should have the right title" do
      page.should have_selector('title', :text => "Admin App | Help")
    end
  end
  
  describe "About page" do
    before { visit about_path }
    it "should have the content About'" do
      page.should have_content('About')
    end
    
    it "should have the right title" do
      page.should have_selector('title', :text => "Admin App | About")
    end
  end
end