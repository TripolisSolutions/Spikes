require 'csv'


first_names = CSV.read('data/first_names.csv').map(&:first)[1..-1].uniq
last_names = CSV.read('data/last_names.csv').map(&:first)[1..-1].uniq

class Array
  def rand_item
    self[rand(self.length)]
  end
end

def gen_s(len)
  o =  [('a'..'z')].map{|i| i.to_a}.flatten
  (0..rand(len)).map{o.rand_item}.join
end

def gen_email
  "#{gen_s(20)}@#{gen_website}"
end

def gen_website
  "#{gen_s(30)}.#{%w(com org edu ru by).rand_item}"
end

def gen_line(firsts, lasts)
  [
   firsts.rand_item,
   firsts.rand_item,
   lasts.rand_item,
   %w(Male Female Transgender Other).rand_item,
   (Time.new(1900 + rand(100)) + ( 60 * 60 * 24) * rand(365)).strftime("%Y-%m-%d"),
   gen_email,
   gen_email,
   gen_website,
   gen_website,
   "#{%w(st. blvd.).rand_item} #{gen_s(30)}",
   rand(1000),
   (rand > 0.9) ? gen_s(10) : "",
   rand(100000),
   gen_s(20).capitalize,
   (rand > 0.5) ? gen_s(10).capitalize : "",
   "Russia",
   "#{%w(st. blvd.).rand_item} #{gen_s(30)}",
   rand(1000),
   (rand > 0.9) ? gen_s(10) : "",
   rand(100000),
   gen_s(20).capitalize,
   (rand > 0.5) ? gen_s(10).capitalize : "",
   "France",
  ]
end

CSV.open('data/result.csv', "w") do |csv|
  csv << %w(first_name middle_name last_name gender day_of_birth email1 email2 website1 website2) +
    %w(street1 house_number1 house_name1 zip_code1 city1 state1 country1) +
    %w(street2 house_number2 house_name2 zip_code2 city2 state2 country2)

  10_000_000.times do |i|
    puts i if i % 100_000 == 0
    csv << gen_line(first_names, last_names)
  end
end
