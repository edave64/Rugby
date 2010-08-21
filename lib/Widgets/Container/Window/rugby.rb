module Rugby
    class Main < Window
        def initialize (*args, &block)
            super(nil,*args, &block)
            @o.signal_connect('delete_event') { Gtk.main_quit }
            Gtk.main
        end

        def add_to_root; end
    end
end