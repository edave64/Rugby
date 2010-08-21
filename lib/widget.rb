require 'pp'

class Widget
    attr_reader :o

    def initialize (root, *args, &block)
        @o = nil
        @root = root
        @args = args
        @arghash = @args[-1].kind_of?(Hash) ? @args.pop : {}
        @block = block
        create_widget()
        compute_arguments()
        compute_block()
        add_to_root()
    end

    def create_widget; end
    
    def height
        @o.height_request
    end
    
    def height= h
        @o.height_request = h
    end
    
    def width
        @o.width_request
    end
    
    def width= w
        @o.width_request = w
    end

    def tooltip
        @o.tooltip_text
    end

    def tooltip= text
        @o.tooltip_text = text
    end
    
    def compute_arguments
        self.height  = @arghash[:height]  if @arghash.include?(:height)
        self.width   = @arghash[:width]   if @arghash.include?(:width)
        self.tooltip = @arghash[:tooltip] if @arghash.include?(:tooltip)
        show
    end
    
    def compute_block; end

    def add_to_root
        @root.add(self)
    end

    def on_click= block
        @o.signal_connect('clicked', &block)
    end

    def click
        @o.signal_emit('clicked')
    end

    def show
        @o.show
    end

    def hide
        @o.hide
    end

    # TODO: on_change, on_blur, on_focus
end