module ResourceSupport

  include ModelSupport

  def set_var(value)
    self.instance_variable_set(attr_name, value)
  end

  def get_var
    self.instance_variable_get(attr_name)
  end

  def attr_name
    "@#{model_name.split('::').last.underscore}"
  end

  def set_resource
    set_var(model.find(params[:id]))
  end

end