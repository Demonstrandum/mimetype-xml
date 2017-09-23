module MimetypeXML
  class Generate
    attr_reader :toml_hash
    alias_method :toml_hash, :parsed
    
    def initialize toml
      @toml_hash = ParseTOML.parse toml
    end

    def self.toml_file file:, xml_dir:, icon_pack:
      toml = File.read File.expand_path(file)
      hash = self.new(toml).parser

      XML.new :hash => hash, :dir => File.expand_path(xml_dir), :icon_pack => icon_pack
    end

  end
end
