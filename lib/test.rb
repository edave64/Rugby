require 'rugby'

Rugby.app :non_resizeable, :title => 'Katze' do
    vbox :width => 64, :expand => false, :fill => false do
        @b = button 'ääää' do
            @b.fill ? @b.fill = false : @b.fill = true
        end
    end
end