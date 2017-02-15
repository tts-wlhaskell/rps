class Shoot
	
	attr_reader :name
	
	#@@ indicates a class variable. This can be accessed by all instances of the class 
	@@shots = []

	def initialize(name)
		@name = name
		@@shots.push self
		@beats = []
	end

	#* before an argument name allows any number of arguments to be accepted
	#great for when you do not know how many arguments will be passed
	def beats(*args)
		args.each do |arg|
			if !@beats.include? arg
				@beats.push arg
			end
		end
	end

	#<=> is the comparison operator in Ruby
	#0/1/0/-1 mimicks the behavior of  this operator in other classes
	def <=>(shot)
		if shot.class == Shoot
			if shot == self
				0
			elsif  @beats.include? shot
				1
			else
				-1
			end
		else
			nil
		end
	end

	#self.method_name sets a class method
	#class methods can be called without an instance of the object
	def self.shots 
		@@shots
	end

end

rock = Shoot.new(:rock)
paper = Shoot.new(:paper)
scissor = Shoot.new(:scissor)

rock.beats(scissor)
paper.beats(rock)
scissor.beats(paper)

again = true

while again
	"\n Shots:"
	Shoot.shots.each_with_index do |shot, i|
		puts "#{i+1}. #{shot.name.capitalize}"
	end

	print "\nInput Shot:"
	player_shot = Shoot.shots[gets.chomp.to_i - 1]
	computer_shot = Shoot.shots[rand(0...Shoot.shots.length)]

	puts "\n#{player_shot.name} vs. #{computer_shot.name}"

	case player_shot <=> computer_shot
	when 0
		result = "tie"
	when 1
		result = "win"
	when -1
		result = "lose"
	end

	puts "You #{result}!\n"

	puts "\nPlay again?"
	input = gets.chomp
	if input[0].capitalize == "Y"
		again = true
	else
		again = false
	end
end