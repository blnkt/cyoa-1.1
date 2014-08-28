
class Avatar < ActiveRecord::Base
	has_many :users
	# scope :creator_avatar?, -> {find_or_create_by(avatar: '~<(@)-}') { |avatar| avatar.name = 'me1234567890' }}
end 