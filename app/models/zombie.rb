class Zombie < ActiveRecord::Base
	include Undead
	after_create :ch_vege, :set_weapons
	has_many :tweets
	has_many :weapons
	validates :name, presence: true
	def set_weapons
		weapons.new(name: "Axe")
		weapons.new(name: "Gun")
	end

	def ch_vege
		if self.vegetarian == true
			self.attributes = {craving: "vegan brains"}
		end
		
	end

	def decapitate
		weapons.first.slice(self, :head)
		self.status = "dead again"
	end

	def swing(weapon)
		true if weapon.name
	end

	def hungry!
		self.hungry=true
	end

	# def pulse
	# 	false
	# end

	def eat(param)
		if param==:brains
			self.hungry=false
		end
	end

	def craving_brains?
		true
	end

	def geolocate
		loc=Zoogle.graveyard_locator(self.graveyard)
		"#{loc[:latitude]},#{loc[:longitude]}"
	end
	def geolocate_with_object
		loc=Zoogle.graveyard_locator(self.graveyard)
		"#{loc[:latitude]},#{loc[:longitude]}"
	end
end
