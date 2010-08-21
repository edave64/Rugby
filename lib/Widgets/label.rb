
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
        end
    end

    module ObjectMethods
        # Creates a label with font size 34
        def title *args
            args.push({}) unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 34
            Label.new(@root, *args)
        end

        # Creates a label with font size 26
        def subtitle *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 26
            Label.new(@root, *args)
        end

        # Creates a label with font size 18
        def tagline *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 18
            Label.new(@root, *args)
        end

        # Creates a label with font size 14
        def caption *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 14
            Label.new(@root, *args)
        end

        # Creates a label with font size 12, but exepts other sizes with :font_size
        def para *args
            Label.new(@root, *args)
        end

        def inscription *args
            args.push {} unless args[-1].kind_of?(Hash)
            args[-1][:font_size] = 10
            Label.new(@root, *args)
        end

        def strong *args
            "<b>#{args.join}</b>"
        end

        def em *args
            "<i>#{args.join}</i>"
        end

        def ins *args
            "<u>#{args.join}</u>"
        end

        def code *args
            "<tt>#{args.join}</tt>"
        end

        def del *args
            "<s>#{args.join}</s>"
        end

        def sub *args
            "<sub>#{args.join}</sub>"
        end

        def sup *args
            "<sup>#{args.join}</sup>"
        end
    end
end
