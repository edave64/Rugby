require 'irb/ruby-lex'
require 'stringio'
require 'rugby'

class MimickIRB < RubyLex
    attr_accessor :started

    class Continue < StandardError; end
    class Empty < StandardError; end

    def initialize
        super
        set_input(StringIO.new)
    end

    def run(str)
        obj = nil
        @io << str
        @io.rewind
        unless l = lex
            raise Empty if @line == ''
        else
            case l.strip
            when "reset"
                @line = ""
            when "time"
                @line = "puts %{You started \#{IRBalike.started.since} ago.}"
            else
                @line << l << "\n"
                if @ltype or @continue or @indent > 0
                    raise Continue
                end
            end
        end
        unless @line.empty?
            obj = $rugby.instance_eval(@line, "(irb)", @line_no)
        end
        @line_no += @line.scan(/\n/).length
        @line = ''
        @exp_line_no = @line_no

        @indent = 0
        @indent_stack = []

        $stdout.rewind
        output = $stdout.read
        $stdout.truncate(0)
        $stdout.rewind
        [output, obj]
    rescue Object => e
        case e when Empty, Continue
        else @line = ""
        end
        raise e
    ensure
        set_input(StringIO.new)
    end
end

CURSOR = ">>"
IRBalike = MimickIRB.new
$stdout = StringIO.new

Rugby.app "IRB", :height => 300, :width => 300 do
    vbox :homogeneous => false do
        @str, @cmd = [CURSOR + " "], ""
        @p = para code('Interactive Ruby ready.'), :width => 300, :height => 276
        @p.o.set_alignment(0, 1)
        @console = edit_line :height => 24, :fill => false, :expand => false do
            @cmd = @console.text
            begin
                out, obj = IRBalike.run(@cmd + ';')
                @str += ["#{CURSOR} ", "#@cmd\n", code("#{out}=> #{obj.inspect}\n")]
            rescue MimickIRB::Empty
            rescue MimickIRB::Continue
                @str += ["#{CURSOR} ", "#@cmd\n.. "]
            rescue Object => e
                @str += ["#{CURSOR} ", "#@cmd\n", code("#{e.class}: #{e.message}\n")]
            end
            @p.replace @str
            @console.text = ""
        end
    end
end