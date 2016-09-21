module ModelSupport

  def model_name

    if module_name
      "#{module_name.classify}::#{controller_name.classify}"
    else
      controller_name.classify
    end

  end

  def model
    model_name.constantize
  end

  def module_name
    if params[:module_name]
      params[:module_name].to_s
    elsif self.class.name.index('::')
      self.class.name.split("::").first.underscore.to_s
    end
  end

end