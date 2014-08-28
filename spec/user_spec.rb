require 'spec_helper'

describe User do

  it { should have_many :adventures }
  it { should have_many :avatars }

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
      


  # describe '#add_avatar' do
  #   it 'add an avatar to the Users profile' do
  #     User1 = User.new({name: 'Neil Gaiman'})
  #     guinotar = Avatar.create({avatar: 'ᶘᵒᴥᵒᶅ', name:'penguin'})
  #     User1.add_avatar('1')
  #     User3.add_avatar('%>?<@')
  #     expect(User1.avatar).to eq("ᶘᵒᴥᵒᶅ")
  #     expect(User3.avatar).to eq('%>?<@')
  #   end
  # end
end