require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject {
    user = User.new(name: 'Dave', username: 'Davidko', password: 'password', email: 'david@mail.com')
    twat = Twat.new(twat: 'Molestiae assumenda dignissimos doloribus sint.', user: user)
    described_class.new(body: 'Tempore sapiente ut mollitia eveniet alias unde dolore.', twat: twat)
  }

  describe "Validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a twat' do
      subject.twat = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:twat) }
  end

end