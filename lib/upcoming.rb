require 'main.rb'

Rugby.new do
    hbox do
        tab_frame do
            tab 'Treeview' do
                tree 'Name', 'Fnord' do
                    item :a, 'Katzen', 'Schmelze'
                    item :b, 'Hasen',  'Bälze'
                end
            end
            tab 'Radio Buttons' do
                radio_group do
                    stack do
                        radio :a, 'Das auf keinen Fall wählen!'
                        radio :b, 'Das nur unter Umständen wählen!'
                    end
                end
            end
            tab 'Colors' do
                color_picker '#5f8'
            end
            tab 'Other' do
                flow do
                    combo ['asdgfwe'] do

                    end
                end
            end
        end
        button 'Wizard' do
            wizard 'Bla!' do
                page 'Nummero uno' do

                end
                page 'Nummero due' do

                end
            end
        end
    end
end