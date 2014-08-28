class User < ActiveRecord::Base
  attr_accessor :new_password, :new_password_confirmation, :the_beginning

  has_many :adventures
  has_many :avatars
  scope :creator?, -> {where(name: 'blnkt', bio: "Content&Code", fave: 'The Princess Bride').first_or_create do |user|
    user.avatar_id = Avatar.find_or_create_by({avatar: '~<(@)-}'}).id
    user.first_adventure
  end}
  
  def first_adventure
    @the_beginning = Adventure.create(user_id: self.id)
    @the_beginning.add_chapter(Chapter.prologue)
    self.add_adventure(@the_beginning)
  end

  def add_adventure adventure
  	adventure.update(user_id: self.id)
  	self.adventures << adventure
  end

  def add_to_progress chapter
    self.adventures.last.add_chapter(chapter)
  end
end