
module Rugby
    class Progress < Widget
        def create_widget
            @o = Gtk::ProgressBar.new
        end
        
        def progress
            @o.fraction
        end
        
        def progress= fraction
            @o.fraction = fraction > 1 ? 1 : fraction < 0 ? 0 : fraction
            if @args.include? :percent
                self.text = "#{(@o.fraction*100).to_i}%"
            end
        end

        def pulse
            @o.pulse
        end

        def text
            @o.text
        end

        def text= t
            @o.text = t
        end
    end

    module ObjectMethods
        def progress *args
            Progress.new(@root, *args)
        end
    end
end
