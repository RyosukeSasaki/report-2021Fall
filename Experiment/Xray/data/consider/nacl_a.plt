reset
set terminal tikz size 10cm, 8cm
set output "../../graph/NaCl_correl.tex"
#set terminal wxt
set size square

set xlabel "$2\\theta\ /\ \\si{\\degree}$"
set ylabel "格子定数 / $\\si{\\angstrom}$"

#set format x "$%.1t \times 10^{%T}$"
#set xrange [0:0]
#set yrange [0:0]

#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

b=5
a=0.1
f(x)=a*x+b
set label 1 right "R=0.882" at graph 0.4, 0.6
fit f(x) "nacl_a.dat" u 1:8 via a, b

plot "nacl_a.dat" u 1:8 every 1 notitle,\
f(x) notitle dt 2 lc -1
