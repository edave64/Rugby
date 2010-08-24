module Rugby
    class Button < Widget
        def create_widget
            @o = Gtk::Button.new
        end

        def compute_arguments
            super
            self.label = @args[0].kind_of?(String) ? @args[0] : ''
        end

        def compute_block
            self.on_click = @block if @block
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
            Button.new(@root, label, *args, &block)
        end
    end
end