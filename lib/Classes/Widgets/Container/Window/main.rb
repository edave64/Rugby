module Rugby
    class Main < Window
        attr_accessor :page_frame

        def initialize (*args, &block)
            $rugby = self
            super(nil,*args, &block)
            @o.signal_connect('delete_event') { Gtk.main_quit }
            Gtk.main
        end

        def add_to_root; end
    end
end