require 'spec_helper'

describe User do

  it { should have_many :adventures }
  it { should have_many :avatars }

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