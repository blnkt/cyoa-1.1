require 'spec_helper'

describe User do

  it { should have_many :adventures }

  # describe '#avatar' do
  #   it 'add an avatar to the Users profile' do
  #     User1 = User.new({name: 'Neil Gaiman'})
  #     User3 = User.new({name: 'Neal Stephenson', id: 4})
  #     User1.add_avatar('penguin')
  #     User3.add_avatar('%>?<@')
  #     expect(User1.avatar).to eq("ᶘᵒᴥᵒᶅ")
  #     expect(User3.avatar).to eq('%>?<@')
  #   end
  # end

  # describe '#add_password' do
  #   it 'add password' do
  #     User1 = User.new({name: 'Neil Gaiman'})
  #     User1.add_password('Neal Stephenson')
  #     expect(User1.password).to eq('Neal Stephenson')
  #   end
  # end

end