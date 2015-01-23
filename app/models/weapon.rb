class Weapon < ActiveRecord::Base
	belongs_to :zombie
	def slice(*arg)
		return nil
	end
end
