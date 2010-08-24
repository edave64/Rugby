module Rugby
    class Container < Widget
        include ObjectMethods

        def add obj
            @o << obj.o
        end

        def append &block
            tmp = @root
            @root = self
            instance_eval &block
            @root = tmp
            @args = nil
        end

        def remove obj
            obj = obj.o if obj.kind_of? Widget
            @o.remove obj
        end

        def clear *args, &block
            @o.each do |child|
                remove child
            end
            @args = args
            tmp = @root
            @root = self
            instance_eval &block
            @root = tmp
            @args = nil
        end

        def compute_block
            tmp = @root
            @root = self
            instance_eval &@block
            @root = tmp
        end
    end
end