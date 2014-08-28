class User < ActiveRecord::Base
  attr_accessor :new_password, :new_password_confirmation, :first_adventure

  has_many :adventures
  has_many :avatars
  before_create :first_adventure
  scope :creator?, -> {where(name: 'blnkt', bio: "Content&Code", fave: 'The Princess Bride').first_or_create do |user|
    user.avatar_id = Avatar.find_by(avatar: '~<(@)-}')
  end}

  def first_adventure
    Adventure.create(user_id: self.id)
  end
end