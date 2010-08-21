module Rugby
    class Box < Container
        def add obj
            gtk_obj = obj.o
            p obj.expand
            @o.pack_start(gtk_obj, obj.expand, obj.fill, obj.padding || 2)
        end

        def repack obj
            gtk_obj = obj.o
            @o.set_child_packing(gtk_obj, obj.expand, obj.fill, obj.padding || 2, Gtk::PACK_START)
        end
    end
end
