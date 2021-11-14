reset
set terminal tikz size 10cm, 8cm
set output "../graph/radical.tex"
#set terminal wxt
set size square

set xlabel "原点からの位置$x$ / cm"
set ylabel "電流あたりの磁場$(B/I)$ / $\\si{\\tesla.\\ampere^{-1}}$"

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

plot "radical.dat" every 1 u 1:7 notitle