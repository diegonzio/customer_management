class Estate < ApplicationRecord
	belongs_to :software, optional: true
	belongs_to :commune, optional: true
end
