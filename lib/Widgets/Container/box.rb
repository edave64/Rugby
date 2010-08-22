module Rugby
    class Box < Container
        attr_reader :fill_childs, :expand_childs
        def compute_arguments
            super
            @fill_childs = @arghash[:fill_childs] ? @arghash[:fill_childs] : true
            @expand_childs = @arghash[:expand_childs] ? @arghash[:expand_childs] : true
            @o.homogeneous = @arghash.include?(:homogeneous) ? @arghash[:homogeneous] : true
        end

        def add obj
            gtk_obj = obj.kind_of?(Widget) ? obj.o : obj
            @o.pack_start(gtk_obj,
                obj.expand.kind_of?(NilClass) ? @expand_childs : obj.expand,
                obj.fill.kind_of?(NilClass) ? @fill_childs : obj.fill,
                obj.padding || 2)
        end

        def repack obj
            gtk_obj = obj.o
            @o.set_child_packing(gtk_obj, obj.expand, obj.fill, obj.padding || 2, Gtk::PACK_START)
        end
    end
end
