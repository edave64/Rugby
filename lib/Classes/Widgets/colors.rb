module Rugby::ObjectMethods
    Color_Scale = 65535 / 255

    def rgb r, g, b
        ::Gdk::Color.new(r*Color_Scale, g*Color_Scale, b*Color_Scale)
    end

    def white
        rgb(255,255,255)
    end

    def black
        rgb(0,0,0)
    end

    def red
        rgb(255,0,0)
    end

    def green
        rgb(0,255,0)
    end

    def blue
        rgb(0,0,255)
    end
end
