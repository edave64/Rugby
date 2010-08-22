require 'rubygems'
require 'rugby'

Rugby.app 'Manual', :width => 800, :height => 600 do
    hbox :homogeneous => false do
        vbox :homogeneous => false, :fill => false, :expand => false, :width=>200, :background => "#444444" do
            subtitle 'Menu'
            button 'Home' do
                visit '/'
            end
            button 'Containers' do
                visit '/containers'
            end
        end
        vbox :width => 600, :homogeneous => false do
            pages do
                page '/' do
                    instance_eval(File.read('pages/index.rb'))
                end
                page '/(.+)' do
                    instance_eval(File.read('pages/'+@args[0]+'.rb'))
                end
            end
        end
    end
end