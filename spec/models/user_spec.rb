require 'rails_helper'

RSpec.describe User, type: :model do

  context "checking association" do
    it { should have_many(:titles) }
    it { should have_many(:contents) }
  end

  context "checking validations" do
    it { should validate_presence_of(:email) }
  end

end
