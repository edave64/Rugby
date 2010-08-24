module Rugby
    class Spin < Widget
        def create_widget
            @o = Gtk::SpinButton.new
        end

        def compute_arguments
            self.range = @args[0], @args[1]
        end

        def range
            @range
        end

        def range= arg
            p arg
            arg = arg[0] if arg.kind_of?(Array) && arg[1] == nil
            @range = arg.kind_of?(Range) ? arg : 0..100
            @range = arg[0]..arg[1] if arg.kind_of?(Array) &&
              arg[0].kind_of?(Integer) && arg[1].kind_of?(Integer)
            @o.set_range(@range.begin, @range.end)
            show
        end
    end

    module ObjectMethods
        # FIXME: Spin buttons dosn't seem to work (Linux)
        # creates a spin box
        #
        # usage:
        #   spin
        #   - or -
        #   spin 0..100
        #   - or -
        #   spin 0, 100
        def spin *args
            Spin.new(@root, *args)
        end
    end
end
