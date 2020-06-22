class History < ApplicationRecord
	belongs_to :play
	paginates_per 5
	enum collect_status: {before_collect: 0, uncollect: 1, collected: 2}
end
