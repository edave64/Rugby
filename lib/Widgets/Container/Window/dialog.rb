
module Rugby
    class Dialog < Window
        attr_reader :result

        Types = {
            :info     => Gtk::MessageDialog::INFO,
            :question => Gtk::MessageDialog::QUESTION,
            :warning  => Gtk::MessageDialog::WARNING,
            :error    => Gtk::MessageDialog::ERROR
        }

        Buttons = {
            :ok       => Gtk::MessageDialog::BUTTONS_OK,
            :none     => Gtk::MessageDialog::BUTTONS_NONE,
            :yes_no   => Gtk::MessageDialog::BUTTONS_YES_NO
        }

        Result = {
            ::Gtk::Dialog::RESPONSE_OK.to_i   => :ok,
            ::Gtk::Dialog::RESPONSE_NONE.to_i => :none,
            ::Gtk::Dialog::RESPONSE_YES.to_i  => :yes,
            ::Gtk::Dialog::RESPONSE_NO.to_i   => :no
        }

        def create_widget
            @o = Gtk::MessageDialog.new(
                @root,
                Gtk::Dialog::DESTROY_WITH_PARENT,
                Types[@arghash[:type]],
                Buttons[@arghash[:buttons]],
                @arghash[:message]
            )
        end

        def compute_arguments
            super
            @o.title = @arghash[:title] || ($rugby ? $rugby.title : 'Rugby') + ' says:'
            @result = Result[@o.run]
            @o.destroy
        end

        def compute_block; end
    end

    module ObjectMethods
        def dialog *args
            Dialog.new(@window, *args)
        end

        def alert message, title = nil
            d = dialog :type    => :info,
                   :buttons => :ok,
                   :message => message,
                   :title   => title
            return nil
        end

        def confirm message, title = nil
            d = dialog :type    => :info,
                   :buttons => :yes_no,
                   :message => message,
                   :title   => title
            return d.result == :yes ? true : false
        end

        def error message, title = nil
            d = dialog :type    => :error,
                   :buttons => :ok,
                   :message => message,
                   :title   => title
            return nil
        end
    end
end
