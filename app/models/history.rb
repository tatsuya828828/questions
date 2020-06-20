class History < ApplicationRecord
	belongs_to :play

	enum collect_status: {before_collect: 0, uncollect: 1, collect: 2}
end
