require 'rails_helper'

RSpec.describe Title, type: :model do

  context "checking columns" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  context "checking index" do
    it { should have_db_index(:user_id) }
  end

  context "checking association" do
    it { should belong_to(:user) }
    it { should have_many(:contents) }
  end

end
