set terminal tikz size 10cm, 8cm
set output "../graph/t-width.tex"
#set terminal wxt
set size square

set xlabel "温度$T$ / $\\si{\\degreeCelsius}$"
set ylabel "半値全幅 / $MHz$"

#set format x "$%.1t \times 10^{%T}$"

#set xrange [0:0]
#set yrange [0:0]

#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

#set key left top box
#set key height 1
#set key width -1
#set key spacing 1.5

plot "t-width.dat" every 1 notitle