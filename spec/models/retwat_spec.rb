require 'rails_helper'

RSpec.describe Retwat, type: :model do
  subject {
    create(:retwat)
  }

  describe "Validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a twat' do
      subject.twat = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:twat) }
  end

end