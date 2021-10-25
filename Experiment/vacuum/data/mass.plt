reset
set terminal tikz size 14cm, 8cm
oname = "../graph/mass/mass.tex"
set output oname
#set terminal wxt
#set size square

set xlabel "分子量"
set ylabel "分圧$p\\ /\\ \\times10^{-5}\\ \\si{Torr}$"

set format y "$%.1t$"

set xrange [0:65]
set yrange [0:5*10**(-5)]

set xtics 0,5,65
set mxtics 5
set ytics 0,1*10**(-5),5*10**(-5)
set mytics 2

#set key left top box
#set key height 1
#set key width -1
#set key spacing 1.5

plot "mass/mass_spectum.txt" notitle