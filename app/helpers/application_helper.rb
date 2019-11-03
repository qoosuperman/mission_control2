module ApplicationHelper
  def mission_enum_name(model, attr)
    I18n.t("activerecord.attributes.#{model.model_name.i18n_key}.#{attr.to_s}.#{model.send(attr)}")
  end
end
