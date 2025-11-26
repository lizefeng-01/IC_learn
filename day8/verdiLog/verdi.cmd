verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec "/home/yian/IC_learn/day8/sim/simv" -args
debImport "-dbdir" "/home/yian/IC_learn/day8/sim/simv.daidir"
debLoadSimResult /home/yian/IC_learn/day8/day8.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "top" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
wvScrollDown -win $_nWave2 0
verdiQtPrefEnv -show
verdiQtPrefEnv -setCurPg "General.Automatic Save"
verdiQtPrefEnv -setCurPg "General.Appearance"
verdiQtPrefEnv -setCurPg "General.Docking and Framework"
verdiQtPrefEnv -setCurPg "General.Miscellaneous"
verdiQtPrefEnv -setCurPg "General.External Browser"
verdiQtPrefEnv -setCurPg "General.Find/Filter"
verdiQtPrefEnv -setCurPg "General.Automatic Save"
verdiQtPrefEnv -setCurPg "General.Docking and Framework"
verdiQtPrefEnv -setCurPg "General.Appearance"
verdiSetFont -font "DejaVu Sans" -size "24"
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
srcSetPreference -cfiletype \
           {Source files (*.v; *.vlg; *.vl; *.vr; *.vrh; *.sv; *.svh; *.ova; *.vhd; *.vhdl; *.psl; *.vu; *.e;*.c; *.cpp; *.cxx; *.cc; *.h; *.hpp; *.hxx; *.hh; *.tcl; *.tk; *.do; *.upf; *.cpf);;HDL files (*.v; *.vlg; *.vl; *.vr; *.vrh; *.sv; *.svh; *.ova; *.vhd; *.vhdl; *.psl; *.vu; *.e);;C/C++ files (*.c; *.cpp; *.cxx; *.cc; *.h; *.hpp; *.hxx; *.hh);;Tcl files (*.tcl; *.tk; *.do);;Power files (*.upf;*.cpf) }
srcSetPreference -profileTime off
simSetInteractiveFsdbFile inter.fsdb
verdiQtPrefEnv -apply
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -apply
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -ok
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 1 2 3 4 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 1 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 2 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 3 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 3 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 3 4 5 )} 
wvSelectSignal -win $_nWave2 {( "top/bus_if_inst(bus_if)" 3 4 5 )} 
wvSetRadix -win $_nWave2 -format UDec
wvZoomAll -win $_nWave2
verdiQtPrefEnv -show
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -apply
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -apply
verdiQtPrefEnv -setCurPg "General.Automatic Save"
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -apply
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -ok
verdiQtPrefEnv -show
srcSetPreference -savefileName novas_autosave1
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -apply
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -apply
verdiSetFont -monoQFont "DejaVu Sans Mono" -monoQFontSize "24"
verdiQtPrefEnv -ok
