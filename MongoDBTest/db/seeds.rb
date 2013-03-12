# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tennantA = Tennant.create(name:"Tennant A")
tennantB = Tennant.create(name:"Tennant B")
tennantC = Tennant.create(name:"Tennant C")


10.times do |x|
   contact = Contact.new(first_name:"Contact#{x}", last_name:"TennantA", middle_name:"of", suffix:"", gender:"M", date_of_birth: "01-01-2013")
   contact.email_addresses.build(email:"test#{x}@mongodbtest.com",active: true)
   contact.phones.build(number:"010101010101",type:"Mobile")
   contact.addresses.build(street_name:"TestStraat", house_number:"222", zip_code:"1001AA", city:"Amsterdam", province:"Noord-Holland", country:"NL")
   contact.websites.build(url:"http://www.google.nl")
   contact.channels.build(channel_id: 12345678,channel_type: "Facebook")
   contact.save!
   tennantA.contacts << contact
   tennantA.save!
end

10.times do |x|
  contact = Contact.new(first_name:"Contact#{x}", last_name:"TennantA", middle_name:"of", suffix:"", gender:"M", date_of_birth: "01-01-2013")
  contact.email_addresses.build(email:"test#{x}@mongodbtest.com",active: true)
  contact.phones.build(number:"010101010101",type:"Mobile")
  contact.addresses.build(street_name:"TestStraat", house_number:"222", zip_code:"1001AA", city:"Amsterdam", province:"Noord-Holland", country:"NL")
  contact.websites.build(url:"http://www.google.nl")
  contact.channels.build(channel_id: 12345678,channel_type: "Facebook")
  contact.save!
  tennantB.contacts << contact
  tennantB.save!
end

10.times do |x|
  contact = Contact.new(first_name:"Contact#{x}", last_name:"TennantC", middle_name:"of", suffix:"", gender:"M", date_of_birth: "01-01-2013")
  contact.email_addresses.build(email:"test#{x}@mongodbtest.com",active: true)
  contact.phones.build(number:"010101010101",type:"Mobile")
  contact.addresses.build(street_name:"TestStraat", house_number:"222", zip_code:"1001AA", city:"Amsterdam", province:"Noord-Holland", country:"NL")
  contact.websites.build(url:"http://www.google.nl")
  contact.channels.build(channel_id: 12345678,channel_type: "Facebook")
  contact.save!
  tennantC.contacts << contact
  tennantC.save!
end