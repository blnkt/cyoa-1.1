require 'spec_helper'
describe Chapter do
	before do
		Chapter.clear
	end

	it { should have_and_belong_to_many :adventures}
	# describe "#initialize" do
	#   it "intialize chapter with an episode" do
	#     new_chapter = Chapter.new({:episode => "When you're here you're family"})
	#   	expect(new_chapter).to be_an_instance_of Chapter
	# 	end

	# 	it "#initialize with an adventurer's name" do
	# 		new_chapter = Chapter.new({:name => "blnkt"})
	# 		expect(new_chapter).to be_an_instance_of Chapter
	# 	end
	# end

	# describe 'Chapter.all' do
	#   it "show all chapters" do
	#   	unexpected_astronaut = Chapter.new({episode: "No one ever expects the unexpected astronaut!!"})
	#   	expect(Chapter.all).to eq [unexpected_astronaut]
	#   end
	# end

	# describe '#add_episode' do
	#   it "add an episode text to a chapter" do
	#   	unexpected_astronaut = Chapter.new({:name => "Unexpected Astronaut"})
	#   	unexpected_astronaut.add_episode("No one ever expects the unexpected astronaut")
	#   	expect(unexpected_astronaut.episode).to eq("No one ever expects the unexpected astronaut")
	#   end
	# end

	# describe '#add_choice' do
	#   it "add a choice to a chapter" do
	#     beatles_chapter = Chapter.new({:episode => "they came in through the bathroom window", :id => 0})
	#     beatles_chapter.add_choice("walk away", 2)
	#     beatles_chapter.add_choice("fight!", 1)
	#     expect(beatles_chapter.choices[1]).to eq(2)
	#     # expect(beatles_chapter.choices[1]
	#   end
	# end

	# describe 'Chapter.find_by_id' do
	#   it "find a chapter by its ID" do
	#     sad_chapter = Chapter.new({:episode => "rain"})
	#     happy_chapter = Chapter.new({:episode => "sunshine", :id => 1})
	#     neutral_chapter = Chapter.new({:episode => "meh", :id => 2})
	#     expect(Chapter.find_by_id(0)).to eq(sad_chapter)
	#     expect(Chapter.find_by_id(1)).to eq(happy_chapter)
	#     expect(Chapter.find_by_id(2)).to eq(neutral_chapter)
	#     expect(Chapter.find_by_id(4)).to eq(nil)

	#   end
	# end
end