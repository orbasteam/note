module Savable

  extend ActiveSupport::Concern

  include ResourceSupport

  included do
    before_action :set_resource, only: [:edit, :update]
  end

  def new
    set_var(model.new)
    render :form
  end

  def create

    set_var(model.new(strong_params))

    begin

      get_var.save!
      flash[:success] = I18n.t('form.saved')

      redirect_to after_save_success_path(get_var)
    rescue Exception => e
      flash.now[:alert] = e.message
      render create_fail_template
    end

  end

  def edit
    render :form
  end

  def update

    begin

      get_var.update! strong_params

      flash[:success] = I18n.t('form.saved')
      redirect_to after_save_success_path(get_var)

    rescue Exception => e
      flash.now[:alert] = e.message
      render update_fail_template
    end

  end

  private

  def create_fail_template
    :form
  end

  def update_fail_template
    :form
  end

  def after_save_success_path(param)
    url_for(action: :index)
  end

  def strong_params
    raise NotImplementedError
  end

end