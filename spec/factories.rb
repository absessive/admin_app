FactoryGirl.define do
  factory :user do
    username "ajit"
    email "ajit@ajit.com"
    first "Ajit"
    last "C"
    password "foobar"
    password_confirmation "foobar"
    # remember_token "rememberme"
  end
end