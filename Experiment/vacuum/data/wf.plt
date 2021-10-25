set terminal tikz size 10cm, 8cm
oname = "../graph/thermion/wf.tex"
set output oname
#set terminal wxt
set size square

set xlabel "$1/T\\ /\\ \\si{\\kelvin^{-1}}$"
set ylabel "$\\log(I_S/T^2)\\ /\\ \\si{arbitary\\ unit}$"

#set format x "$%.1t \times 10^{%T}$"

set yrange [-12:-8]
set xrange [0.00050:0.00059]

set ytics -12,1,-8
set mytics 2
set xtics 0.00050,0.00002,0.00060
set mxtics 2

set key right top box
set key height 1
set key width -1
set key spacing 1.5

a=-10000
b=15
y(x) = a*x + b

fit y(x) "thermion/line.dat" u (1/$1):(log($2/($1)**2)) via a, b

plot "thermion/line.dat" u (1/$1):(log($2/($1)**2)) title "data points",\
y(x) title "Fitting Line"