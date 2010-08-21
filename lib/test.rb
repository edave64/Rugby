require 'main.rb'

Rugby.app :main, :non_resizeable, :title => 'Katze' do
    vbox do
        title 'LOL!!!'
        para 'Labels should work!'
    end
end