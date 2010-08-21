module Rugby
    class Window < Container
        def create_widget
            @o = Gtk::Window.new(Gtk::Window::TOPLEVEL)
        end

        def add_to_root; end

        def compute_arguments
            super
            if @arghash.include?(:title)
                self.title = @arghash[:title]
            elsif @args[0].kind_of?(String)
                self.title = @args[0]
            end
            self.allow_shrink = false if @arghash.include?(:non_shrinkable) || @arghash.include?(:non_resizable)
            self.allow_grow = false if @arghash.include?(:non_growable) || @arghash.include?(:non_resizable)
            self.blocking = true if @arghash.include?(:blocking)
            self.opacity = @arghash[:opacity] if @arghash.include?(:opacity)
            show_all
        end

        def title; @o.title; end

        def title= title
            @o.title = title
        end

        def allow_grow?
            @o.allow_grow?
        end

        def allow_grow= setting
            @o.allow_grow = setting
        end

        def allow_shrink?
            @o.allow_shrink?
        end

        def allow_shrink= setting
            @o.allow_shrink = setting
        end

        def blocking?; @o.modal?; end

        def blocking= blocking
            @o.modal = blocking
        end

        def maximize
            @o.maximize
        end

        def unmaximize
            @o.unmaximize
        end

        def fullscreen
            @o.fullscreen
        end

        def unfullscreen
            @o.unfullscreen
        end

        def show_all
            @o.show_all
        end

        # FIXME: don't seem work!
        def opacity; @o.opacity; end

        def opacity= opacity
            @o.opacity = opacity
        end

        def position; @o.position; end

        # TODO
        def relative_position!
            @offset_x = @root.position[0] - @o.position[0]
            @offset_y = @root.position[1] - @o.position[1]

        end
    end

    module ObjectMethods
        def window *args, &block
            tmp = @window
            @window = win = Window.new(*args, &block)
            p @window
            @window = tmp
            return win
        end
    end
end