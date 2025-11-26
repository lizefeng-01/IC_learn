verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec "/home/yian/IC_learn/day1/D/simv" -args
debImport "-dbdir" "/home/yian/IC_learn/day1/D/simv.daidir"
debLoadSimResult /home/yian/IC_learn/day1/D/dff.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
