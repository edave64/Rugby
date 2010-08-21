require 'main.rb'

Rugby.app :width => 800, :height => 600 do
    hbox do
        vbox :width=>200, :background => "#444444" do
            button '/' do
                visit '/'
            end
            button '/a' do
                visit '/a'
            end
            button '/b' do
                visit '/b'
            end
        end
        vbox do
            pages do
                page '/' do
                    instance_eval(File.read('Manual/pages/index.rb'))
                end
                page '/(.+)' do
                    instance_eval(File.read('Manual/pages/'+@args[0]+'.rb'))
                end
            end
        end
    end
end