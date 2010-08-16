module Rugby
    class HBox < Container
        def create_widget
            @o = Gtk::HBox.new
        end

        def compute_arguments
            @o = Gtk::HPaned.new if @args.include? :handels
            super
        end
    end

    module ObjectMethods
        def hbox *args, &block
            HBox.new @root, *args, &block
        end
    end
end