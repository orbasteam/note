class TitlesController < ApplicationController

  include Savable

  def index
    @titles = Title.where(user_id: current_user)
  end

  def sort
    set_resource

    if @title.user_id == current_user.id
      @title.set_list_position(params[:position])
    end

    render body: nil

  end

  private

  def strong_params
    params.require(:title).permit(:name).merge(user: current_user)
  end

end