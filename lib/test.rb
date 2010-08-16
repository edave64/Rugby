require 'main.rb'

Rugby.app :main, :non_resizeable, :title => 'Katze' do
    hbox do
        vbox do
            input  :txt1, 'bla!'
            button :btn1, 'adegaw' do
                btn1.label = txt1.text
            end
            progress :bar, :percent
            tab_frame do
                tab "pulse" do
                    button "pulse" do
                        bar.pulse
                    end
                end
                tab "add/sub" do
                    button "+5%" do
                        bar.progress += 0.05
                    end
                    button "-5%" do
                        bar.progress -= 0.05
                    end
                end
            end
            radio_group do
                radio 'a'
                radio 'b'
                radio 'c'
            end
        end
    end
end