
class Chapter < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  has_many :choices, class_name: 'Chapter', foreign_key: 'parent_chapter_id'
  belongs_to :parent_chapter, class_name: 'Chapter'
  
  def add_episode episode
    self.update(episode: episode.to_s)
  end

  def add_choice prompt
    choice = Chapter.create(prompt: prompt, episode: "\nYour Princess is in another castle: \nEnter 'ae' to add an episode to this chapter\n", parent_chapter_id: self.id)
    self.choices << Chapter.create
    choice.update(parent_chapter_id: self.id)
  end
end 