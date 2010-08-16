module Rugby
    class Container < Widget
        include ObjectMethods

        def add obj
            obj = obj.o if obj.kind_of? Widget
            @o << obj
        end

        def remove obj
            obj = obj.o if obj.kind_of? Widget
            @o >> obj
        end

        def compute_block
            tmp = @root
            @root = self
            instance_eval &@block
            @root = tmp
        end

        def border

        end
    end
end