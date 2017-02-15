class Shoot
	
	ttr_reader :name

	@@shots = []

	def initialize(name)
		@name = name
		@@shots.push self
		@beats = []
	end

	def beats(*args)
		args.each do |arg|
			if !@beats.include? arg
				@beats.push arg
			end
		end
	end

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

	def self.shots
		@@shots
	end

end