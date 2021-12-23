reset
set terminal tikz size 10cm, 8cm
set output "../../graph/NaCl_inten.tex"
#set terminal wxt
set size square

set xlabel "測定値"
set ylabel "理論値"

set logscale xy

set xrange [1:110]
set yrange [1:110]

#set format x "$%.1t \times 10^{%T}$"
#set xrange [0:0]
#set yrange [0:0]

#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

set key left top box
set key height 1
set key width -2
set key spacing 1.5


a=1
f(x) = a*x

plot "nacl_inten.dat" u 4:5 every 1 title "(測定値,理論値)",\
f(x) title "$y=x$" lc -1 dt 2
