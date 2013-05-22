require 'csv'

i = 0
CSV.foreach('data/result.csv',
            { headers:           true,
              converters:        :numeric,
              header_converters: :symbol }) do |line|
  p i if i % 10000 == 0
  i += 1
end
