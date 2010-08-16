
module Rugby
    class RadioGroup < Widget
        def create_widget
            @o = Gtk::Notebook.new
            @next_label = ''
        end

        def compute_arguments
            super
            instance_eval &@block if @block
        end

        def add_to_root; end

        def add obj
            obj = obj.o if obj.kind_of? Widget
            @o.append_page(obj, Gtk::Label.new(@next_label))
        end

        def tab label, *args, &block
            @next_label = label
            HBox.new self, *args, &block
            @next_label = ''
        end
    end

    module ObjectMethods
        def radio_group *args
            raise 'radio groups can not be stacked' if @radio_group
            @radio_group = RadioGroup.new(nil, *args)
            yield if block_given?
            @radio_group = nil
        end
    end
end