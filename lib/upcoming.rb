# This file has some elements which are not implemented yet

require 'main.rb'

Rugby.new do
    hbox do
        tab_frame do
            tab 'Treeview' do
                tree do
                    item 'Fruits' do
                        item 'Apple'
                        item 'Pear'
                        item 'Lemon'
                    end
                    item 'Animals' do
                        item 'Cats'
                        item 'Dogs'
                        item 'Mice'
                    end
                end

                list 'Fruit', 'Color' do
                    item 'Apple', 'Green, Yellow, Red'
                    item 'Pear', 'Green'
                    item 'Lemon', 'Yellow'
                end
            end
            tab 'Pickers' do
                color_button '#5f8'
                file_field './'
                font_button 'Areal', :bold, :size => 12
            end
            tab 'Other' do
                flow do
                    para :text, 'Noting selected'
                    combo 'Apple', 'Pear', 'Lemon' do |selected|
                        text.text = 'Selected: ' + selected
                    end
                end
            end
        end
        button 'Wizard' do
            wizard 'Bla!' do
                page 'Nummero uno' do
                    para 'You can skip this page!'
                end
                page 'Nummero due' do
                    para 'You shouldn\'t have skiped the previos page'
                end
            end
        end
    end
end