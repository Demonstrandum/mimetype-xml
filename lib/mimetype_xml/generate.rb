module MimetypeXML
  class Generate

    def initialize toml
      @toml_hash = ParseTOML.parse toml
    end

    def parser; @toml_hash; end

    def self.toml_file file:, xml_dir:, icon_pack:
      toml = File.read File.expand_path(file)
      hash = self.new(toml).parser

      XML.new :hash => hash, :dir => File.expand_path(xml_dir), :icon_pack => icon_pack
    end

  end
end
