module Rugby
    class DropDown < Widget
        def create_widget
            @o = Gtk::ComboBox.new()
        end

        def compute_arguments
            super
            self.entries = @args[0].kind_of?(Array) ? @args[0] : []
        end

        def compute_block
            self.on_change = @block if @block
        end

        def entries
            @items
        end

        def entries= ary
            ary = [ary] unless ary.kind_of?(Array)
            @items = ary
            sync
        end

        def value
            @o.active_text
        end

        def value= v
            i = @items.index(v)
            return nil if i == nil
            @o.active = i
        end

        def append ary
            ary = [ary] unless ary.kind_of?(Array)
            @items += ary
            sync
        end

        def prepend ary
            ary = [ary] unless ary.kind_of?(Array)
            @items = ary + @items
            sync
        end

        def change
            @o.signal_emit('changed')
        end

        def on_change= block
            @handler = @o.signal_connect('changed') do
                block[value]
            end
        end

        private
        def sync
            clear_box
            @items.each do |i|
                @o.append_text i
            end
        end

        def clear_box
            @o.signal_handler_block(@handler) if @handler
            id = @o.active
            loop do
                @o.active = 0
                break if @o.active_text == nil
                @o.remove_text 0
            end
            @o.active = id
            @o.signal_handler_unblock(@handler) if @handler
        end
    end

    module ObjectMethods
        # creates a drop down box
        def drop_down *args, &block
            DropDown.new(@root, *args, &block)
        end
    end
end
