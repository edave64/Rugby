module Rugby
    class Pages < Widget
        def initialize root, *args, &block
            @root = root
            @pages = {}
            VBox.new(self, *args)
            instance_eval(&block) if block_given?
            visit('/')
        end

        def add obj
            @o = obj
            @root.add(@o)
        end

        def page url, &block
            url = Regexp.new('\A'+url.to_s+'\Z') unless url.kind_of?(Regexp)
            @pages[url] = block
        end

        def visit url
            @pages.each do |key, value|
                @result = key.match(url)
                if @result
                    @o.clear(*(@result[1]?@result[1..-1]:{}), &value)
                    return true
                end
            end
            @o.clear do
                para '404: Page not found!'
            end
            return false
        end
    end

    module ObjectMethods
        def pages *args, &block
            $rugby.page_frame = @page_frame = Pages.new(@root, *args, &block)
        end

        def visit url
            $rugby.page_frame.visit(url) if $rugby.page_frame
        end
    end
end
