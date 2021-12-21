reset
set terminal tikz size 10cm, 8cm
set output "../../graph/KCl_raw.tex"
#set terminal wxt
set size square

set xlabel "$2\\theta$ / $\\si{\\degree}$"
set ylabel "Intensity / arbitrary unit"

#set format x "$%.1t \times 10^{%T}$"
set xrange [0:65.4]
#set yrange [0:0]

set xtics 0,10,70
set mxtics 2
#set ytics 0,0,0
#set mytics 2

#set key left top box
#set key height 1
#set key width -1
#set key spacing 1.5

plot "KCl0001.txt" u 1:2 every 1 notitle
