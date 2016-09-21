require 'set'
require 'rails_helper'

shared_examples_for "checking auth" do

  it "redirect to sign in page" do
    expect(subject).to redirect_to(new_user_session_path)
  end

end