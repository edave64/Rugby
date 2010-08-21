
module Rugby
    class Label < Widget
        Justify = {
            :left   => Gtk::JUSTIFY_LEFT,
            :right  => Gtk::JUSTIFY_RIGHT,
            :center => Gtk::JUSTIFY_CENTER,
            :fill   => Gtk::JUSTIFY_FILL
        }

        def create_widget
            @o = Gtk::Label.new()
        end

        def compute_arguments
            super
            size = @arghash[:font_size] || 12
            text = @args.join('');
            @o.set_markup("<span font_desc=\"#{size}\">#{text}</span>")
            @o.justify = Justify[@arghash[:justify] || :left]
            p @o.justify
        end
    end

    module ObjectMethods
        def title *args
            args.push({}) unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 34
            Label.new(@root, *args)
        end

        def subtitle *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 26
            Label.new(@root, *args)
        end

        def tagline *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 18
            Label.new(@root, *args)
        end

        def caption *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 14
            Label.new(@root, *args)
        end

        def para *args
            Label.new(@root, *args)
        end

        def inscription *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 10
            Label.new(@root, *args)
        end
    end
end
