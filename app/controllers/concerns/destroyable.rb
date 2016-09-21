module Destroyable

  include ResourceSupport

  extend ActiveSupport::Concern

  def destroy

    set_resource

    begin

      get_var.destroy!
      flash[:success] = t('form.deleted')

    rescue Exception => e
      flash[:alert] = e.message
    end

    redirect_to action: :index
  end

end