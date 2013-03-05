== Welcome to the Admin App

(Ruby 1.9.3 and Rails 3.2)
Tested on Safari and Google Chrome. There are existing JS issues while using Firefox, be warned.

This is a sample Rails App which allows a user to sign up to a user admin system. Anyone can sign up, and become a new user. However, only an admin can Add/Edit/Update users. 

The steps to deploy as always the same.

1. bundle install
2. rake db:setup
3. rake db:seed
4. rake db:test:prepare
5. rails s

This is a work in progress. I'm mostly doing this to improve my Rails as well as styling skills, and will update this infrequently.

== Notes

There's some server-side validation thrown in for good measure, as well as the ability to do in-line-edits.