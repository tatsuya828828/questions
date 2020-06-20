class Question < ApplicationRecord
	validates :quest, :answer, presence: true
	enum undisplay_switch: {display: 0, undisplay: 1}
end
