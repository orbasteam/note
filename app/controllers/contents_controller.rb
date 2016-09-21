class ContentsController < ApplicationController

  include Savable
  include Destroyable

  def index
    @titles = Title.includes(:contents).where(user_id: current_user)
  end

  private

  def strong_params
    params.require(:content).permit(:title_id, :subject, :content).merge(user: current_user)
  end

end
