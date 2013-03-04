require 'spec_helper'

describe User do
  before do 
    @user = User.new(username: "Example", email: "foo@bar.com", first: "foo", last: "bar", 
    password: "foobar", password_confirmation: "foobar") 
  end
  
  subject { @user }
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:first) }
  it { should respond_to(:last) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token)}
  it { should be_valid }
  
  describe "when username is not present" do
    before { @user.username = " "}
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when username is too long" do
    before { @user.username = "a"* 17 }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      emails = %w[foo@bar,com bar foo_bar.com foo@bar. ]
      emails.each do |e|
        @user.email = e
        @user.should_not be_valid
      end
    end
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      emails = %w[ foo@bar.com foo_foo@bar.com Us-er@foo.in ]
      emails.each do |e|
        @user.email = e
        @user.should be_valid
      end
    end
  end
  
  describe "when username is already taken" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.username = @user.username.upcase
      user_with_same_username.save
    end
    it { should_not be_valid }
  end
  
  describe "when email is already used" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase      
      user_with_same_email.save
    end
    it { should_not be_valid }    
  end
  
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " "}
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "with a short password" do
    before { @user.password = @user.password_confirmation = "a" * 5}
    it { should be_invalid }
  end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_username(@user.username) }
    
    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
end
