require 'spec_helper'

describe Adventure do

it { should have_and_belong_to_many :chapters }
it {should belong_to :user}
it { should validate_presence_of :user }

  describe "#add_chapter" do
    it "add a chapter to an adventurer's progress" do
      new_user = User.create(name: 'billy')
      unexpected_astronaut = Chapter.create({prompt: "Unexpected Astronaut"})
      new_user.adventures.first.add_chapter(unexpected_astronaut)
      expect(new_user.adventures.first.chapters.last).to eq(unexpected_astronaut)
    end
  end
end