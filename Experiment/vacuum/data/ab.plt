reset
set terminal tikz size 8cm, 8cm
oname = "../graph/mass/ab.tex"
set output oname
#set terminal wxt
set size square

set xlabel "Time / sec"
set ylabel "圧力$p$ / $\\times10^{-6}$ Torr"

#set format y "$%.1t$"

#set xrange [0:65]
#set yrange [0:5*10**(-5)]

set xtics 0,500,2000
set mxtics 5

set style arrow 1 size character 2,20 filled linewidth 2 linecolor 2
set arrow 1 from 174,4 to 174,3.7
set label 1 center at first 174,4.2 "吸着開始" font ",8"
plot "mass/pt-data_absorption.txt" every 5 u 1:($2*10**6) notitle