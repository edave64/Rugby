module Rugby
    class VBox < Box
        def create_widget
            @o = Gtk::VBox.new
        end

        def compute_arguments
            @o = Gtk::VPaned.new if @args.include? :handels
            super
        end

        def compute_block
            super
        end
    end

    module ObjectMethods
        def vbox *args, &block
            VBox.new @root, *args, &block
        end
    end
end