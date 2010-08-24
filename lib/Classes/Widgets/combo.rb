module Rugby
    class Combo < DropDown
        def create_widget
            @o = Gtk::ComboBoxEntry.new
            show
        end
    end

    module ObjectMethods
        # FIXME: seems to freeze Gtk
        # creates a combo box
        def combo *args, &block
            Combo.new(@root, *args, &block)
        end
    end
end
