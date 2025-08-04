module ApplicationHelper
  def icon(klass, text = nil)
    icon_tag = tag.i(class: klass)
    if text.blank?
      return tag.span(icon_tag)
    end
    text_tag = tag.span ' ' + text
    return tag.span(icon_tag + text_tag)
  end

end
