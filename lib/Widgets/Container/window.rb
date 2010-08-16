module Rugby
    class Window < Container
        def create_widget
            @o = Gtk::Window.new(Gtk::Window::TOPLEVEL)
        end

        def add_to_root; end

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

        # don't work!
        def opacity; @o.opacity; end

        def opacity= opacity
            @o.opacity = opacity
        end

        def position; @o.position; end

        def compute_arguments
            super
            self.title = @arghash[:title] if @arghash.include?(:title)
            self.allow_shrink = false if @arghash.include?(:non_shrinkable) || @arghash.include?(:non_resizable)
            self.allow_grow = false if @arghash.include?(:non_growable) || @arghash.include?(:non_resizable)
            self.blocking = true if @arghash.include?(:blocking)
            self.opacity = @arghash[:opacity] if @arghash.include?(:opacity)
        end

        # TODO
        def relative_position!
            @offset_x = @root.position[0] - @o.position[0]
            @offset_y = @root.position[1] - @o.position[1]

        end
    end

    module ObjectMethods
        def window *args, &block
            @o = Window.new *args, &block
        end
    end
end