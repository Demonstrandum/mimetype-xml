# MimetypeXML
> Custom mimetype from TOML to XML

## Install
You need Ruby and Gems (gems comes with ruby)
---
Install this gem with
```shell
gem install mimetype-xml 

# You might want to run this with sudo,
# or add the Gem userdir to the beginning of your $PATH variable
# like so in your bashrc: `PATH=$(ruby -e 'print Gem.user_dir')/bin:$PATH`
# This depends on your platform.
```

## Usage
Create the TOML config (`./custom-mime.toml`):
```toml
## CUSTOM MIMETYPES TOML CONFIG FILE ##
# Optional variables ard marked with `(opt.)` in a commant at the 
# end of the line


# Add mimetype for elixir files
[x-application-elixir]

type    = "application/x-elixir"
pattern = ["*.ex", "*.exs"] # Always in an array
                            # (even if only one pattern, e.g. ["*.ext"])

comment      = "Elixir File" # Default language
comment_lang = [ ["no", "Elixir Fil"], ["la", "Ordo Elixir"] ] # etc. (opt.)

icon = "mimetypes/application-x-elixir.svg"
size = 48 # I don't really know

xml_file = "elixir-file-mimetype.xml" # (opt.), not useful...


# Another for crystal files

[x-application-crystal]
type = "application/x-crystal"
pattern =  [".cr"]
comment = "Crystal File"
icon = "mimetypes/application-x-crystal.svg"
size = 48

# That simple to add new mimetypes, just make the icon in the
# path specified in the `icon` variable. 
# e.g. 'mimetypes/appliaction-x-myfile.svg'
```

Then generate the xml files and install it through a ruby script (`./generate-mimetypes.rb`):
```ruby
require 'mimetype_xml'
require 'toml' # `toml` comes with this gem (`mimetype_xml`)

xml = MimetypeXML::Generate.toml_file(
  :file      => './custom-mime.toml', # The location of the TOML config
  :xml_dir   => './.xml', # Choose somewhere, make sure the dir exists
  :icon_pack => '~/.icons/YOUR_ICON_PACK' # Replace this with the install dir of your iconpack
)

files = xml.write_files
files.install
```

Then run the script from your shell:
```shell
ruby ./generate-mimetypes.rb
```



The binary file doesn't do anything at the moment.
