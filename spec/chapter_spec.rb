require 'spec_helper'
describe Chapter do

	it { should have_and_belong_to_many :adventures}
	it { should have_many :choices }
	it { should belong_to  :parent_chapter }

	describe '#add_episode' do
	  it "add an episode text to a chapter" do
	  	unexpected_astronaut = Chapter.create({prompt: "Unexpected Astronaut"})
	  	unexpected_astronaut.add_episode("No one ever expects the unexpected astronaut")
	  	expect(unexpected_astronaut.episode).to eq("No one ever expects the unexpected astronaut")
	  end
	end

	describe '#add_choice' do
	  it "add a choice to a chapter" do
	    beatles_chapter = Chapter.create({prompt: "glasses", episode: "they came in through the bathroom window"})
	    beatles_chapter.add_choice('there is no silver spoon')
	    expect(beatles_chapter.choices.first.parent_chapter_id).to eq(beatles_chapter.id)
	  end
	end
end