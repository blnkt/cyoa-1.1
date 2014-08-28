require 'spec_helper'

describe Avatar do
  it { should have_many :users }

  # describe '.creator_avatar?' do
  #   it 'makes creators avatar if isnt present in the database already' do
  #     me = Avatar.create({avatar: '~<(@)-}', name: 'me1234567890'})
  #     expect(Avatar.creator_avatar?).to eq(me)
  #   end
  #   it 'makes creator if isnt present in the database already' do
  #     not_me = Avatar.create({name: 'bob'})
  #     expect(Avatar.creator_avatar?.name).to eq('me1234567890')
  #   end
  # end
end