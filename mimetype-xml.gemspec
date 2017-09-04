require_relative 'lib/mimetype_xml'

Gem::Specification.new do |s|
  s.name        = 'mimetype-xml'
  s.version     = MimetypeXML::version
  s.required_ruby_version = '>= 1.9.2'
  s.executables << 'mimetype-xml'
  s.date        = Time.now.to_s.split(/\s/)[0]
  s.summary     = "Custom mimetypes from TOML to XML Edit"
  s.description = "Add custom mimetypes by parsing a TOML file in to an XML file which can be installed."
  s.authors     = ["Demonstrandum"]
  s.email       = 'knutsen@jetspace.co'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w{ LICENSE README.md }
  s.require_path= 'lib'
  s.add_dependency 'toml', '~> 0.1.2'
  s.homepage    = 'https://github.com/Demonstrandum/mimetype-xml'
  s.license     = 'GPL-2.0'
end
