require_relative 'mimetype_xml/toml'
require_relative 'mimetype_xml/xml'
require_relative 'mimetype_xml/generate'

module MimetypeXML
  VERSIONS = { :major => 0, :minor => 1, :tiny => 0 }

  def self.version *args
    VERSIONS.flatten.select.with_index { |val, i| i.odd? }.join '.'
  end
end
