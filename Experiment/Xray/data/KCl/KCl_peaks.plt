reset
set terminal tikz size 10cm, 8cm
set output "../../graph/KCl_peaks.tex"
#set terminal wxt
set size square

set xlabel "$2\\theta$ / $\\si{\\degree}$"
set ylabel "Intensity / arbitrary unit"

#set format x "$%.1t \times 10^{%T}$"
set xrange [20:55]
#set yrange [0:0]

set xtics 20,10,55
set mxtics 2
#set ytics 0,0,0
#set mytics 2

set label 1 right '(200)' at first 25,85550 rotate by 90
set label 2 left '(220)' at first 40.527,40120 rotate by 90
set label 3 left '(222)' at first 50.310,34675 rotate by 90

#set key left top box
#set key height 1
#set key width -1
#set key spacing 1.5

plot "KCl0001.txt" u 1:2 every 1 notitle
