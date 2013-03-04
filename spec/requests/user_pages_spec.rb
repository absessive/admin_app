require 'spec_helper'
require 'support/utilities.rb'

describe "UserPages" do
  subject { page }
  
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    # it { should have_selector('h1', text: user.username )}
    # it { should have_selector('title', text: user.username )}    
  end
  
  describe "signup page" do
    before { visit signup_path }
    
    it { should have_selector('h1', text: 'Sign up')}
    it { should have_selector('title', text: full_title('Sign up')) }
  end
  
  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    
    describe "with valid information" do
      before do
          fill_in "Username", with: "ajit"
          fill_in "Email", with: "ajit@ajit.com"
          fill_in "First", with: "Ajit"
          fill_in "Last", with: "C"
          fill_in "Password", with: "foobar"
          fill_in "Confirm password", with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
    
  end
  
  
end
