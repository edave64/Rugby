require 'gtk2'

module Rugby
    Version = 0.3

    def self.app *args, &block
        $rugby = Main.new *args, &block
    end

    module ObjectMethods
        @root = nil
        @page_frame = nil
    end

    path = File.expand_path(File.dirname(__FILE__))+'/'
    Dir.glob(File.expand_path(path+'Classes/**/**')).sort.reverse.each do |file|
        require file if(File.stat(file).file?)
    end
end