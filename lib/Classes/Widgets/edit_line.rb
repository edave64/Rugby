module Rugby
    class EditLine < Widget
        def create_widget
            @o = Gtk::Entry.new()
        end

        def compute_arguments
            super
            self.text = @args[0].kind_of?(String) ? @args[0] : ''
        end

        def compute_block
            self.on_activate &@block if @block
        end

        def text
            @o.text
        end

        def text= t
            @o.text = t
        end

        def on_activate &block
            @o.signal_connect('activate') do
                block.call text
            end
        end
    end

    module ObjectMethods
        def edit_line *args, &block
            EditLine.new(@root, *args, &block)
        end
    end
end