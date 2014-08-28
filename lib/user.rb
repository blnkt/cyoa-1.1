class User < ActiveRecord::Base
  attr_accessor :new_password, :new_password_confirmation, :the_beginning

  has_many :adventures
  has_many :avatars
  before_create :first_adventure
  scope :creator?, -> {where(name: 'blnkt', bio: "Content&Code", fave: 'The Princess Bride').first_or_create do |user|
    user.avatar_id = Avatar.find_by(avatar: '~<(@)-}')
  end}

  # def the_beginning
  # 	@the_beginning
  # end

  def first_adventure
    @the_beginning = Adventure.create(user_id: self.id)
    @the_beginning.add_chapter(Chapter.prologue)
  end
end