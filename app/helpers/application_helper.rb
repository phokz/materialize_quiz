module ApplicationHelper
  def dropdown(form, attribute, options)
    h = {"••• "+I18n.t("no_specific_#{attribute}") => ''}
    h.merge!(Hash[*options.map{|i| i.class == Array ? i : [i.respond_to?(:dropdown_name) ? i.dropdown_name : i.name, i.id]}.flatten])
    method = "#{attribute}_id".to_sym
    value = form.object.send(method)
    form.select method, options_for_select(h, value.nil? ? '' : value), {}, {class: 'material'}
  end

  def dropdown_fixme(form, attribute, options)
    # for some reason, column is named default_payment_type and not default_payment_type_id
    h = {"••• "+I18n.t("no_specific_#{attribute}") => ''}
    h.merge!(Hash[*options.map{|i| i.class == Array ? i : [i.name, i.id]}.flatten])
    method = attribute.to_sym
    value = form.object.send(method)
    form.select method, options_for_select(h, value.nil? ? '' : value), {}, {class: 'material'}
  end
end
