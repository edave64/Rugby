require 'gtk2'

module Rugby
    IDs = {}

    def self.app *args, &block
        Main.new *args, &block
    end

    module ObjectMethods
        def method_missing id
            return ::Rugby::IDs[id]
        end
    end
end

require 'widget.rb'

Dir.glob('Widgets/**/**').sort.reverse.each do |file|
    require file if(File.stat(file).file?)
end
