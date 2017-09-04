module MimetypeXML
  class XML
    
    def initialize hash:, dir:, icon_pack:
      @hash = hash
      @dir = dir
      
      @icon_pack = icon_pack
      @icons = Array.new
      @icons_info = Hash.new
    end

    def files_hash
      xml_files = Hash.new

      @hash.each do |heading, sub_hash|
        @type = sub_hash['type']
        @pattern = String.new
        sub_hash['pattern'].each { |ext| @pattern << "<glob pattern=\"#{ext}\" />\n" }
        
        @comment = sub_hash['comment']

        @icons << sub_hash['icon']
        @icons_info[heading] = {
          :icon => sub_hash['icon'],
          :size => sub_hash['size']
        } 

        # Optional
        @comment_lang = String.new
        if sub_hash.key? 'comment_lang' then
          sub_hash['comment_lang'].each do |lang|
            code, desc = lang
            @comment_lang << "<comment xml:lang=\"#{code}\">#{desc}</comment>\n"
          end
        end
        
        # Make file hash
        title = sub_hash.key?('xml_file') ? sub_hash['xml_file'] : "#{heading}.xml"
        xml_files[title] = document
      end
      
      xml_files
    end

    def write_files
      files = files_hash

      files.each do |file, contents|
        bare  = contents.split("\n").map(&:rstrip).join("\n")
        File.open("#{@dir}/#{file}", 'w') { |f| f.write bare }
      end
       

      # Files associated with installer for them
      Installer.new(
        :icon_pack => @icon_pack,
        :icons_info => @icons_info,
        :xml_dir => @dir
      )
    end
    
    def document
      xml = <<-XML
        <?xml version="1.0"?>
        <mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
          <mime-type type="#{@type}">  
            <comment>#{@comment}</comment>
            #{@comment_lang}
            #{@pattern}
          </mime-type>
        </mime-info>
      XML
    end
  end
end
