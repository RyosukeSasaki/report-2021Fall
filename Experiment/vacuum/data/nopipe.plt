reset
set terminal wxt
fname = "nopipe/nopipe_P-vs-T_5.dat"
oname = "../graph/nopipe/5.tex"
set terminal tikz size 10cm, 8cm
set output oname
set size square

set xlabel "Time / sec"
set ylabel "Pressure $10^{-3}$/$\\si{\\pascal}$"

#set format x "$%.1t \times 10^{%T}$"

x_begin = 115
x_end = 180
set xrange [x_begin:x_end]
set yrange [0:9]

#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

#set key left top box
#set key height 1
#set key width -1
#set key spacing 1.5

fit_begin=121.5
fit_end=180
a=7
b=x_end
c=5
d=1
f(x) = a*exp(-(x-b)/c)+d
fit [fit_begin:fit_end] f(x) fname via a,b,c,d

plot fname every 1 title "Data" lt 21 lc -1 ps 2,\
    f(x) title "Fitting curve" lc 2