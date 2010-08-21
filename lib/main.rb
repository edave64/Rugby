require 'gtk2'

module Rugby
    def self.app *args, &block
        Main.new *args, &block
    end

    module ObjectMethods
    end
end

require 'widget.rb'

Dir.glob('Widgets/**/**').sort.reverse.each do |file|
    require file if(File.stat(file).file?)
end
