arr = File.read '../SampleFiles/birthday_list.txt'
hash = {}

arr.each_line do |line|
	parts = line.split(',')

	name = parts[0]
	year = parts[2]

	mid = parts[1].split
	month = mid[0]
	day = mid[1]

	hash[name] = [year, month, day]
end

puts "Who's Birthday would you like to look up?"
name = gets.chomp

date = hash[name]
year = date[0]
month = date[1]
day = date[2]

if date == nil
	puts "#{name} isn't in our records, I'm sorry!"
	exit
end

today = Time.new
next_birthday = Time.local(today.year, month, day)
if next_birthday < today
	next_birthday = Time.local(today.year + 1, month, day)
end

birthdate = Time.local(year, month, day)

diff = today - birthdate
diff_help = Time.new(0) + diff
diff_years = diff_help.year

diff = next_birthday - today
diff_help = Time.new(0) + diff
diff_months = diff_help.month
diff_days = diff_help.day

puts "#{name} will be #{diff_years+1} in #{diff_months} months and #{diff_days} days."