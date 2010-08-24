title "Containers", :width => 600

para strong('Warning: ') + "The Rugby API is still under development. Commands and structure can change in the next versions!\n\n",
  "Rugby basicly knows two kinds of containers: ", em('hbox'), " and ", em('vbox'), '. '+
  em('hbox') + " places it's subelements horizontal, " + em('vbox') + " vertical.", :width => 600

subtitle "Usage:", :width => 600
hbox :homogeneous => false, :width => 600 do
    para code(
        "Rugby.app do\n" +
        "    hbox do\n" +
        "        vbox do\n" +
        "            button '1'\n" +
        "            button '2'\n" +
        "        end\n" +
        "        vbox do\n" +
        "            button '3'\n" +
        "            button '4'\n" +
        "        end\n" +
        "    end\n" +
        "end"
    ), :width => 568
    button "»", :fill => false, :expand => false, :width => 32 do
        window 'Rugby' do
            hbox do
                vbox do
                    button '1'
                    button '2'
                end
                vbox do
                    button '3'
                    button '4'
                end
            end
        end
    end
end