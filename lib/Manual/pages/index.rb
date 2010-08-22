title "Rugby 0.2", :width => 600

para strong('Warning: ') + "The Rugby API is still under development. Commands and structure can change in the next versions!", :width => 600

subtitle "What is Rugby?", :width => 600
para "Rugby(RbGUI) is a Shoes like GTK Wrapper. It's, except for it's dependencies, completely written in Ruby.\n\n", :width => 600

subtitle "Hello World!", :width => 600
hbox :homogeneous => false, :width => 600 do
    para code(
        "Rugby.app do\n" +
        "    button 'Say it!' do\n" +
        "        alert('Hello World!')\n"+
        "    end\n" +
        "end"
    ), :width => 568
    button "»", :fill => false, :expand => false, :width => 32 do
        window 'Rugby' do
            button 'Say it!' do
                alert('Hello World!')
            end
        end
    end
end