module Rugby
    class Spin < Widget
        def create_widget
            @o = Gtk::SpinButton.new
        end
    end
end
