module MimetypeXML
  class Installer
    
    def initialize icon_pack:, icons_info:, xml_dir:
      @icon_pack = icon_pack
      @icons = icons_info
      @xml_dir = xml_dir
    end

    def install
      ###  XDG-ICON-RESOURCES DOES NOT SUPPORT SVGs            ###
      ###  BUT SPEC DOES, BUG:                                 ###
      ###  https://bugs.freedesktop.org/show_bug.cgi?id=91759  ###
      #@icons.each do |title, details|
      #  icon = "#{File.expand_path @icon_pack}/#{details[:icon]}"
      #  %x{ xdg-icon-resource install --context mimetypes --size #{details[:size]} #{icon} #{title} }
      #end

      Dir[@xml_dir + '/*.xml'].each do |file|
        %x{ xdg-mime install #{file} 2>/dev/null 2>/dev/null }
      end
      
    end

  end
end
