module MimetypeXML
  class ParseTOML
    
    def initialize toml_string
      @toml = toml_string
    end
  
    def to_h
      TOML::Parser.new(@toml).parsed
    end

    def self.parse string
      parser = self.new string
      parser.to_h
    end
  end
end

