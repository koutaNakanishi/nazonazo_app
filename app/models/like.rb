class Like < ApplicationRecord
	belongs_to :nazo, counter_cache: :good_num
	belongs_to :user
end
