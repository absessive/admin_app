# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create!( :username => "admin", :first => "The", :last => "Administrator", :email => "admin@theadminapp.com", :password => "foobar", :password_confirmation => "foobar", :roles => "admin")
User.create!( :username => "ajit", :first => "Ajit", :last => "Chakrapani", :email => "ajit@ajit.com", :password => "foobar", :password_confirmation => "foobar", :roles => "admin")
15.upto(25) do |v|
  User.create!( :username => "user#{v}", :first => "First#{v}", :last => "Last#{v}", :email => "First#{v}@Last#{v}.com", :password => "foobar123", :password_confirmation => "foobar123", :roles => "guest")
end