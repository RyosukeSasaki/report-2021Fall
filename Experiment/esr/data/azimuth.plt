#set terminal wxt
set terminal tikz size 10cm, 8cm
set output "../graph/azimuth.tex"
set size square

set xlabel "方位$\\theta$ / $\\si{\\degree}$"
set ylabel "B / nT"

#set format x "$%.1t \times 10^{%T}$"

set xrange [0:180]
set yrange [-40000:40000]

set ytics -40000,20000,40000
set mytics 2
set xtics 0,30,180
set mxtics 1

set key right bottom box
set key height 1
set key width -1
set key spacing 1.5
pi=3.14159265359
a=-30000
f(x) =a*cos(x*pi/180)
fit f(x) "azimuth.dat" via a
plot "azimuth.dat" every 1 title "測定値", f(x) title "Fitting曲線"