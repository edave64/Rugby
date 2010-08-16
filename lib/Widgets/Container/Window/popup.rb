module Rugby
    class Popup < Window
        def create_widget
            @o = Gtk::Window.new(Gtk::Window::POPUP)
        end
    end

    module ObjectMethods
        def popup *args, &block
            @o = Popup.new @root, *args, &block
        end
    end
end