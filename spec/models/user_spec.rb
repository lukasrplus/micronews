require 'spec_helper'

describe User do

  # runs the code inside the block before each example
  before { @user = User.new(name: 'Lukas', email: 'lukas@lukas.com')}

  # makes @user the default subject of the test example,
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when a name is not present" do
    # Setting the User Name to an invalid input:
    before { @user.name = "" }
    # Test that it is really invalid
    it { should_not be_valid }
  end

  describe "when an email adress is not present" do
    before { @user.email = "" }
    it { should_not be_valid}
  end

  describe "when a user name is too long" do
    before { @user.name = "Luca" * 40 }
    it { should_not be_valid }
  end



end
