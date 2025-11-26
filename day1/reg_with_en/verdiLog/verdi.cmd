verdiSetActWin -dock widgetDock_<Message>
simSetSimulator "-vcssv" -exec "/home/yian/IC_learn/day1/reg_with_en/simv" -args
debImport "-dbdir" "/home/yian/IC_learn/day1/reg_with_en/simv.daidir"
debLoadSimResult /home/yian/IC_learn/day1/reg_with_en/wave.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
