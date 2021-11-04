require 'rails_helper'

RSpec.describe Twat, type: :model do
  subject {
    create(:twat)
  }

  describe "Validations" do
    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with less then 2 symbols' do
      subject.twat = 'a'
      expect(subject).to_not be_valid
    end
    it 'is not valid with more then 140 symbols' do
      subject.twat = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Aenean commodo ligula eget dolor.Aenean massa. Cum sociis natoque penatibus et magnis
dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec,
pellentesqueeu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo,
fringilla vel, aliquet nec,vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a,
 venenatis vitae, justo. Nullam dictum feliseu pede mollis pretium. Integer tincidunt.
Cras dapibus. Vivamus elementum semper nisi. Aenean vulputateeleifend tellus. Aenean
leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante,
dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.
Quisque rutrumAenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper
ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenastempus, tellus eget condimentum
rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc,
blandit vel, luctus pulvinar.'
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
    it { should have_many(:retwats) }
    it { should have_many(:comments) }
  end

end