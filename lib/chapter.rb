
class Chapter < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  has_many :choices, class_name: 'Chapter', foreign_key: 'parent_chapter_id'
  belongs_to :parent_chapter, class_name: 'Chapter'

  scope :prologue, -> {find_or_create_by(prompt: "Welcome to the Adventure") do |chapter| 
    chapter.episode = "You awake in a field..."
    chapter.add_choice("pick up the keys and walk to the road")
    chapter.add_choice("Walk the bike out of the field to a nearby road")
    chapter.add_choice("Put on the hat and head towards the sound of water")
  end}

  def add_choice prompt
    choice = Chapter.create(prompt: prompt, episode: "\nYour Princess is in another castle: \nEnter 'ae' to add an episode to this chapter\n", parent_chapter_id: self.id)
    self.choices << Chapter.create
    choice.update(parent_chapter_id: self.id)
  end
end 