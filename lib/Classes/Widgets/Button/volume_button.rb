
module Rugby
    class VolumeButton < Button
        def create_widget
            @o = Gtk::VolumeButton.new()
        end

        def compute_arguments
            super
        end
        
        def toggled
            
        end
    end

    module ObjectMethods
        def volume *args
            VolumeButton.new(@root, *args)
        end
    end
end
