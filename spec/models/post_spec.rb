require 'rails_helper'

RSpec.describe Post, type: :model do

	it 'is a valid post' do
		expect(build(:post)).to be_valid
	end

	it 'is a valid registered post' do
		expect(build(:post, :registered)).to be_valid
	end	

	it 'is not a valid post if there is not content' do
		expect(build(:post, content: nil)).to_not be_valid
	end	

	it 'is not a valid post if there is not user name or user id' do
		expect(build(:post, nome: nil, user_id: nil)).to_not be_valid
	end

	it 'check content size less than 500 chars' do
		expect( build(:post).content.size < 500)
	end

end
