
class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :chapters
  belongs_to :user
  validates :user, presence: true

  def add_chapter chapter
    unless self.chapters.include?(chapter)
      self.chapters << chapter
    else
      branch = Adventure.create(user_id: self.user_id)
      self.chapters.slice[0..-2].each { |chapter| branch.chapters << chapter }
    end
  end
end