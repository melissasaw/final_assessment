class Pokemon < ApplicationRecord
	belongs_to :user
	scope :species, -> (species) { where species: city }
end
