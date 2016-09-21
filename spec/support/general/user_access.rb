require 'set'
require 'rails_helper'

shared_examples_for "user access" do

  it "user can access" do
    sign_in user
    expect(subject).to be_success
  end

end