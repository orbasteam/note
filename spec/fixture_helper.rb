module FixtureHelper

  extend ActiveSupport::Concern

  def user
    @user ||= FactoryGirl.create(:user, :user)
  end

end