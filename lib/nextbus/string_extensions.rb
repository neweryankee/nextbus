class String

  def underscore
    self.class.underscore(self)
  end

  def self.underscore(camel_cased_word)
    camel_cased_word.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr(" ", "_").
      tr("-", "_").
      downcase
  end

end