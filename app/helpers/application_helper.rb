module ApplicationHelper
  def mission_enum_name(model, attr)
    I18n.t("activerecord.attributes.#{model.model_name.i18n_key}.#{attr.to_s}.#{model.send(attr)}")
  end

  def mission_status(model)
    I18n.t("activerecord.attributes.#{model.model_name.i18n_key}.aasm_state.#{model.status}")
  end
end
