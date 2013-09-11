class OrangeTree
	attr_reader :height, :oranges, :alive

	def initialize
		@height = 1 #assume height is in feet
		@oranges = 0
		@age = 0
		@alive = true
	end

	def one_year_passes
		if !@alive
			puts "The Orange Tree is dead, nothing happens."
			exit
		end

		@height += 2
		@age += 1
		@oranges = 0
		if @age > 50
			puts "The Orange Tree has grown too old and has died."
			@alive = false
		elsif @age > 5
			@oranges = @age * 10
		end
	end

	def pick_orange
		puts "MMMM... the orange is delicious!"
		@orange -= 1
	end

end
