year = 0
month = 0
day = 0

loop do
  puts "What year were you born?"
  year = gets.chomp.to_i

  if year == 0 || year < 1800
    puts "Please enter a valid year!"
  else
    break
  end
end

loop do
  puts "What month were you born?"
  month = gets.chomp.to_i

  if month <= 0 || month > 12
    puts "Please enter a valid month!"
  else
    break
  end
end

loop do
  puts "What day were you born?"
  day = gets.chomp.to_i

  if day <= 0 || day > 31
    puts "Please enter a valid day!"
  else
    break
  end
end

birthday = Time.local(year, month, day)
today = Time.new
diff = today - birthday
diff_help = Time.new(0) + diff
diff_years = diff_help.year
puts "You are #{diff_years} old!"
diff_years.times do 
  puts 'SPANK!'
end