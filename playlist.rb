mp3_files = Dir['/Users/kaross/RubyCode/SampleFiles/**/*.mp3']

puts 'What would you like to call this play list?'
list_name = gets.chomp

mp3_files.shuffle!

Dir.chdir '/Users/kaross/RubyCode/SampleFiles/'

filename = "#{list_name}.m3u"

File.open filename, 'w' do |f|
	mp3_files.each do |mp3|
		f.write mp3+"\n"
	end
end

# I don't really understand the 'better playlist problem' - shuffle seems to work well enough for me
# since I don't have very much music on my computer!