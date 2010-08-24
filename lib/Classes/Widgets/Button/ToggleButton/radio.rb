module Rugby
    # FIXME:
    # Radiobuttons are always active
    class Radio < ToggleButton
        def create_widget
            label = @args[0].kind_of?(String) ? @args[0] : ''
            @o = Gtk::RadioButton.new(label)
        end

        def compute_arguments
            self.active = @args.include?(:active) ? true : false
        end

        def label
            @o.label
        end

        def label= t
            @o.label = t
        end

        def group
            @o.group
        end

        def group= t
            @o.group = t
        end
    end

    module ObjectMethods
        def radio default, *args
            r = Radio.new(@root, default, *args)
            r.group = @radio_group.o if @radio_group
        end
    end
end