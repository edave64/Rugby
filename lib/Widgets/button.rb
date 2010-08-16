module Rugby
    class Button < Widget
        def create_widget
            @o = Gtk::Button.new
        end

        def compute_arguments
            super
            self.label = @args[0].kind_of?(String) ? @args[0] : ''
        end

        def label
            @o.label
        end

        def label= l
            @o.label = l
        end
    end

    module ObjectMethods
        def button label, *args, &block
            b = Button.new(@root, label, *args)
            b.on_click = block if block_given?
            return b
        end
    end
end