require 'csv'

f = File.open('transaction.txt')

data = CSV.parse(f.read)

total_charge = 0

data.each do |columns|
  puts "Company Name: #{columns[2]}"
  total_charge += columns.last.to_i
end

puts "total charge is #{total_charge}"




