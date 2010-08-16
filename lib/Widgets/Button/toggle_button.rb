
module Rugby
    class ToggleButton < Button
        def create_widget
            @o = Gtk::ToggleButton.new
        end

        def compute_arguments
            super
            self.label = @args[0].kind_of?(String) ? @args[0] : ''
            self.toggle if @args.include? :toggled
        end
        
        def toggled?
            @o.active?
        end

        def toggle
            @o.active = true
        end

        def untoggle
            @o.active = false
        end

        def on_toggle= block
            @o.signal_connect('toggled', &block)
        end

        def toggle
            @o.signal_emit('toggled')
        end
    end

    module ObjectMethods
        def toggle label, *args, &block
            b = ToggleButton.new(@root, label, *args)
            b.on_toggle = block if block_given?
            return b
        end
    end
end
