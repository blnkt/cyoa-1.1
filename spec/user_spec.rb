require 'spec_helper'

describe User do

  it { should have_many :adventures }
  it { should have_many :avatars }
  it { should }

  describe '.creator?' do
    it 'makes creator if isnt present in the database already' do
      me = User.create({name: 'blnkt', bio: "Content&Code", fave: 'The Princess Bride'})
      expect(User.creator?).to eq(me)
    end
    it 'makes creator if isnt present in the database already' do
      not_me = User.create({name: 'bob'})
      expect(User.creator?.name).to eq('blnkt')
    end
  end

  describe '#first_adventure' do
    it 'starts user off on a new adventure with the prologue' do
      me = User.create({name: 'bob'})
      me.first_adventure
      expect(me.the_beginning.chapters.first.prompt).to eq('Welcome to the Adventure')
    end
  end
  
  describe '#add_adventure' do
    it 'adds an adventure to users experience' do
      me = User.create({name: 'bob'})
      new_adventure = Adventure.create(user_id: me.id)
      me.add_adventure(new_adventure)
      expect(me.adventures.last).to eq(new_adventure)
    end
  end

    describe "#add_to_progress" do
    it "add a chapter to an adventurer's progress" do
      new_user = User.create(name: 'billy')
      new_user.first_adventure
      unexpected_astronaut = Chapter.create({prompt: "Unexpected Astronaut"})
      new_user.add_to_progress(unexpected_astronaut)
      expect(new_user.adventures.last.chapters.last).to eq(unexpected_astronaut)
    end
  end
end