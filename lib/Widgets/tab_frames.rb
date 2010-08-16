module Rugby
    class TabFrames < Widget
        def create_widget
            @o = Gtk::Notebook.new
            @next_label = ''
        end

        def compute_arguments
            super
            instance_eval &@block if @block
        end

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
        def tab_frame *args, &block
            return TabFrames.new(@root, *args, &block)
        end
    end
end
