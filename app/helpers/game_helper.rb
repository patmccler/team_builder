module GameHelper

  def game_type_radio_button_with_label(form, unit_type)
    if form.object.persisted?
      if form.object.unit_type == unit_type
        form.radio_button(:unit_type, unit_type, checked: true) +
          form.label(:unit_type, unit_type.titleize)
      end
    else
      form.radio_button(:unit_type, unit_type) +
        form.label(:unit_type, unit_type.titleize)
    end
  end
end
