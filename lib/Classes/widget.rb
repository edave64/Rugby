
class Widget
    attr_reader :expand, :fill, :padding
    attr_reader :o

    def initialize (root, *args, &block)
        @o = nil
        @expand = true
        @fill = true
        @root = root
        @args = args
        @arghash = @args[-1].kind_of?(Hash) ? @args.pop : {}
        @block = block
        create_widget()
        compute_arguments()
        compute_block() if @block
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

    def fill= f
        @fill = f
        @root.repack(self) if @root.kind_of?(::Rugby::Box)
    end

    def expand= f
        @expand = f
        @root.repack(self) if @root.kind_of?(::Rugby::Box)
    end

    def tooltip
        @o.tooltip_text
    end

    def tooltip= text
        @o.tooltip_text = text
    end
    
    def compute_arguments
        self.fill = @arghash.include?(:fill) ? @arghash[:fill] :
          @arghash.include?(:height) || @arghash.include?(:width) ? false : nil
        self.expand     = @arghash.include?(:expand) ? @arghash[:expand] : nil
        self.height     = @arghash[:height]     if @arghash.include?(:height)
        self.width      = @arghash[:width]      if @arghash.include?(:width)
        self.tooltip    = @arghash[:tooltip]    if @arghash.include?(:tooltip)
        self.background = @arghash[:background] if @arghash.include?(:background)
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

    def background
        @o
    end

    def background= color
        if color.kind_of?(Gdk::Color)
            [Gtk::STATE_NORMAL, Gtk::STATE_ACTIVE, Gtk::STATE_PRELIGHT,
                Gtk::STATE_SELECTED,Gtk::STATE_INSENSITIVE].each do |state|
                @o.modify_bg(state, color)
            end
        else
            [Gtk::STATE_NORMAL, Gtk::STATE_ACTIVE, Gtk::STATE_PRELIGHT,
                Gtk::STATE_SELECTED,Gtk::STATE_INSENSITIVE].each do |state|
                @o.modify_bg(state, Gdk::Color.parse(color))
            end
            
        end
    end

    # TODO: on_change, on_blur, on_focus
end