gender = ["male", "female"]
batch = []
100.times do |x|
  batch.clear
  File.open('db/dataMar-12-2013.csv').each_with_index do |line, index|
    line = line.chomp.downcase
    field_values = line.split('|')
    next if index == 0
    contact = Contact.new(first_name: "#{field_values[0]}", last_name:"#{field_values[1]}", middle_name:"", suffix:"", gender:"#{gender[index%2]}", date_of_birth: "#{Random.new.rand(1..31)}-#{Random.new.rand(1..12)}-#{Random.new.rand(1920..2013)}")
    contact.email_addresses.build(email: "#{field_values[2]}", active: true)
    contact.email_addresses.build(email: "#{field_values[3]}", active: true)
    contact.addresses.build(street_name:"#{field_values[4]}", house_number:"#{field_values[5]}", zip_code:"#{field_values[6]}", city:"#{field_values[7]}", province:"#{field_values[8]}", country:"#{field_values[9]}")
    contact.addresses.build(street_name:"#{field_values[10]}", house_number:"#{field_values[11]}", zip_code:"#{field_values[12]}", city:"#{field_values[13]}", province:"#{field_values[14]}", country:"#{field_values[15]}")
    contact.websites.build(url:"#{field_values[16]}")
    contact.websites.build(url:"#{field_values[17]}")
    contact.channels.build(channel_id: "#{index%5}" ,channel_type: "#{field_values[18]}")
    batch << contact.as_document
  end
  Contact.with(collection: "klm", database: "multitenant").collection.insert(batch)
  puts "#{x} batches of 496 documents inserted"
end
