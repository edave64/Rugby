
module Rugby
    class Image < Widget
        def create_widget
            @o = Gtk::Image.new
        end

        def compute_arguments
            super
            self.file = @args[0].kind_of?(String) ? @args[0] : ''
        end

        def file= f
            @o.file = f
        end

        def file
            @o.file
        end
    end
end
