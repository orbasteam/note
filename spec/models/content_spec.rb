require 'rails_helper'

RSpec.describe Content, type: :model do

  context "checking columns" do
    it { should have_db_column(:subject).of_type(:string) }
    it { should have_db_column(:title_id).of_type(:integer) }
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  context "checking validation" do
    it { should validate_presence_of(:title_id) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user_id) }
  end

  context "checking association" do
    it { should belong_to(:title) }
    it { should belong_to(:user) }
  end

  context "checking index" do
    it { should have_db_index(:title_id ) }
    it { should have_db_index(:user_id ) }
  end

end
