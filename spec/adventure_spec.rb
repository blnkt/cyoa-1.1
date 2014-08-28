require 'spec_helper'

describe Adventure do

it { should have_and_belong_to_many :chapters }
it {should belong_to :user}
it { should validate_presence_of :user }

  describe "#add_chapter" do
    it "add a chapter to an adventurer's progress" do
      four_adventure = Adventure.new({user_id: 1})
      unexpected_astronaut = Chapter.create({prompt: "Unexpected Astronaut"})
      four_adventure.add_chapter(unexpected_astronaut)
      expect(four_adventure.chapters).to eq([unexpected_astronaut])
    end
  end
end