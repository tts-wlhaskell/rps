class Shoot

	def initialize(name)
		@name = name
		@@shots.push self
		@beats = []
	end

	def beats(*args)

	end

	def <=>(shot)

	end

	def self.shots
		@@shots
	end

end