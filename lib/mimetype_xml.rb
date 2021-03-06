require 'toml'
require 'pp'
require_relative 'mimetype_xml/install'
require_relative 'mimetype_xml/toml'
require_relative 'mimetype_xml/xml'
require_relative 'mimetype_xml/generate'

module MimetypeXML
  VERSIONS = { :major => 1, :minor => 2, :tiny => 4 }

  def self.version *args
    VERSIONS.flatten.select.with_index { |val, i| i.odd? }.join '.'
  end
end
