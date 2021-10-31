reset
#set terminal wxt
oname = "../graph/r_depend.tex"
set terminal tikz size 8cm, 8cm
set output oname
set size square

set xlabel "管径$\\phi$ / $\\si{\\milli\\metre}$"
set ylabel "コンダクタンス / $\\si{\\liter.\\second^{-1}}$"

#set format x "$%.1t \times 10^{%T}$"

set xrange [0:20]
set yrange [0:2]

#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

set key left top box
set key height 1
set key width 1
set key spacing 1.5
a=0.001
n=3
b=0
f(x) = a*x**n+b

fit f(x) "r_depend.dat" via a, n

plot "r_depend.dat" title "data points", f(x) title "Fitting Curve"