describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  describe ".alphabetical" do
    it "returns an array" do
      expect(User.alphabetical).to be_a ActiveRecord::Relation
    end

    it "return an array that is sorted alphabetically" do
      users = %w(Adam Ruby Java).map do |name|
        User.create! name: name, email: "#{name}@example.com", password: "asdfasdf"
      end
      expect(User.alphabetical).to eq users.sort_by(&:name)
    end
  end

  describe "#contact_info" do
    it "says Harley Trung <harley@coderschool.vn>" do
      user = User.create email: 'harley@coderschool.vn', name: "Harley Trung", password: 'asdfasdf'
      expect(user.contact_info).to eq "Harley Trung <harley@coderschool.vn>"
    end
  end
end
