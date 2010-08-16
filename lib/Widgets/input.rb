module Rugby
    class Input < Widget
        def create_widget
            @o = Gtk::Entry.new()
        end

        def compute_arguments
            super
            self.text = @args[0].kind_of?(String) ? @args[0] : ''
        end

        def text
            @o.text
        end

        def text= t
            @o.text = t
        end
    end

    module ObjectMethods
        def input default, *args
            Input.new(@root, default, *args)
        end
    end
end