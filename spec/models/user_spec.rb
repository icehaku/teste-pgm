require 'rails_helper'

RSpec.describe User, type: :model do

	it 'is a valida user' do
		expect(build(:user)).to be_valid
	end

	it 'needs a name' do
		expect(build(:user, nome: nil)).to_not be_valid
	end

	it 'needs email' do
		expect(build(:user, email: nil)).to_not be_valid
	end	

	it 'needs a password' do
		expect(build(:user, password: nil)).to_not be_valid
	end	

end

