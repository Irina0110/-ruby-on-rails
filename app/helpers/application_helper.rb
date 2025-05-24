module ApplicationHelper
  def tdb(key)
    locale = I18n.locale.to_s
    Translation.find_by(locale: locale, key: key)&.value || "##{key}##"
  end
end
