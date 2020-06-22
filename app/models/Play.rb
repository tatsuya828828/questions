class Play < ApplicationRecord
	has_many :histories

	paginates_per 5
end
